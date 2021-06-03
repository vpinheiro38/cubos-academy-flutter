import 'dart:async';

import 'package:aula16/form_model.dart';
import 'package:aula16/user.dart';

class FormViewModel {
  final model = FormModel();

  String get name => model.user!.name;
  String get surname => model.user!.surname;

  StreamController<String> streamController = StreamController();

  void updateName(String name) {
    if (model.user != null)
      model.user!.name = name;
    else
      model.user = User(name, '');
  }

  void updateSurname(String surname) {
    if (model.user != null)
      model.user!.surname = surname;
    else
      model.user = User('', surname);
  }

  void saveUser() {
    model.saveUser();
  }

  void loadCurrentUser() {
    model.currentUser().then((value) => streamController.add(value));
  }

  void deleteCurrentUser() async {
    var currentUser = await model.currentUser();
    var userID = currentUser.split(' ')[0];
    if (userID != 'Usuário') model.deleteUser(int.parse(userID));
  }
}
