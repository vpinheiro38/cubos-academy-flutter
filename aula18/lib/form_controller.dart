import 'package:aula16/form_model.dart';

class FormController {
  final model = FormModel();

  String get name => model.name ?? '';
  String get surname => model.surname ?? '';
  Future<String> get fullName => model.getFullName();

  Future<String> partialName() {
    return model.getPartialName();
  }

  Future<String> get partialSurname => model.getPartialSurname();

  void updatePartialSurname(String partialSurname) {
    model.savePartialSurname(partialSurname);
  }

  void updatePartialName(String partialName) {
    model.savePartialName(partialName);
  }

  void updateName(String name) {
    model.name = name;
  }

  void updateSurname(String surname) {
    model.surname = surname;
  }

  void saveUser() {
    model.saveUser();
  }
}
