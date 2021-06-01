import 'package:aula16/internal_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter extends InternalStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<String> getPartialSurname() async {
    String? surname = await _secureStorage.read(key: 'partialSurname');

    if (surname != null) {
      return surname;
    } else {
      return 'Usuário não encontrado!';
    }
  }

  @override
  Future<String> getPartialName() async {
    String? name = await _secureStorage.read(key: 'partialName');

    if (name != null) {
      return name;
    } else {
      return 'Usuário não encontrado!';
    }
  }

  @override
  void savePartialSurname(String surname) async {
    await _secureStorage.write(key: 'partialSurname', value: surname);
    print('Dados Salvos - SecureStorage');
  }

  @override
  void savePartialName(String name) async {
    await _secureStorage.write(key: 'partialName', value: name);
    print('Dados Salvos PartialName - SecureStorage');
  }

  @override
  Future<String> getFullName() async {
    String? name = await _secureStorage.read(key: 'name');
    String? surname = await _secureStorage.read(key: 'surname');

    if (name != null && surname != null) {
      return name + ' ' + surname;
    } else {
      return 'Usuário não encontrado!';
    }
  }

  @override
  void saveUser(String name, String surname) async {
    await _secureStorage.write(key: 'name', value: name);
    await _secureStorage.write(key: 'surname', value: surname);
    print('Dados Salvos - SecureStorage');
  }
}
