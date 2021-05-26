import 'package:aula16/internal_storage.dart';
import 'package:aula16/shared_preferences_adapter.dart';

class FormModel {
  String? name;
  String? surname;
  final InternalStorage internalStorage;

  FormModel({InternalStorage? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void saveUser() {
    if (name == null) return;
    if (surname == null) return;

    internalStorage.saveUser(name!, surname!);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
