import 'package:aula16/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String> getFullName() async {
    final internalPref = await _prefs;
    String? name = internalPref.getString('name');
    String? surname = internalPref.getString('surname');

    if (name != null && surname != null) {
      return name + ' ' + surname;
    } else {
      return 'Usuário não encontrado!';
    }
  }

  @override
  void saveUser(String name, String surname) async {
    final internalPref = await _prefs;
    internalPref.setString('name', name);
    internalPref.setString('surname', surname);
    print('Dados Salvos - SharedPreferences');
  }
}
