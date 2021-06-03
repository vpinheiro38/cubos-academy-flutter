import 'package:aula16/internal_storage.dart';
import 'package:aula16/shared_preferences_adapter.dart';
import 'package:aula16/sql_adapter.dart';
import 'package:aula16/user.dart';

class FormModel {
  User? user;
  final InternalStorage internalStorage;

  FormModel({InternalStorage? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  void saveUser() {
    if (user?.name == null) return;
    if (user?.surname == null) return;

    internalStorage.saveUser(user!.name, user!.surname);
  }

  void deleteUser(int userID) {
    internalStorage.deleteUser(userID);
  }

  Future<String> currentUser() {
    return internalStorage.getFullName();
  }
}
