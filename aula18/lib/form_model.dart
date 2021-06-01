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

  void savePartialSurname(String partialSurname) {
    internalStorage.savePartialSurname(partialSurname);
  }

  void savePartialName(String partialName) {
    internalStorage.savePartialName(partialName);
  }

  Future<String> getPartialSurname() {
    return internalStorage.getPartialSurname();
  }

  Future<String> getPartialName() {
    return internalStorage.getPartialName();
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
