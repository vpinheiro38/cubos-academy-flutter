abstract class InternalStorage {
  void saveUser(String name, String surname);
  Future<String> getFullName();
}
