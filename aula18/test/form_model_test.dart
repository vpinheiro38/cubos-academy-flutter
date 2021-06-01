import 'package:aula16/form_model.dart';
import 'package:aula16/internal_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FormModel should save fullname', (WidgetTester tester) async {
    final model = FormModel(internalStorageAdapter: MockStorage());

    model.name = 'Victor';
    model.surname = 'Pinheiro';
    model.saveUser();

    expect(model.getFullName(), completion(isNotNull));
    model.getFullName().then((fullname) {
      expect(fullname, 'Victor Pinheiro');
    });
  });
}

class MockStorage extends InternalStorage {
  String _name = '';
  String _surname = '';

  @override
  Future<String> getFullName() {
    if (_name != '' && _surname != '') {
      return Future.value(_name + ' ' + _surname);
    } else {
      return Future.value('Usuário não encontrado!');
    }
  }

  @override
  void saveUser(String name, String surname) {
    _name = name;
    _surname = surname;
  }

  @override
  Future<String> getPartialName() {
    // TODO: implement getPartialName
    throw UnimplementedError();
  }

  @override
  Future<String> getPartialSurname() {
    // TODO: implement getPartialSurname
    throw UnimplementedError();
  }

  @override
  void savePartialName(String name) {
    // TODO: implement savePartialName
  }

  @override
  void savePartialSurname(String surname) {
    // TODO: implement savePartialSurname
  }

}
