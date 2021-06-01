abstract class InternalStorage {
  void savePartialSurname(String surname);
  Future<String> getPartialSurname();

  void savePartialName(String name);
  Future<String> getPartialName();

  void saveUser(String name, String surname);
  Future<String> getFullName();
}
