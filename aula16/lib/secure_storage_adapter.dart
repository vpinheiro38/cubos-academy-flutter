import 'package:aula16/internal_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter extends InternalStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

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
