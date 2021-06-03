import 'package:aula16/user.dart';

abstract class InternalStorage {
  void saveUser(String name, String surname);
  Future<String> getFullName();
  void deleteUser(int userID);
}
