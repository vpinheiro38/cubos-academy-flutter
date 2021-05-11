import 'dart:async';

import 'package:aula15_classe/home_model.dart';

class HomeViewModel {
  HomeModel _model = HomeModel();
  StreamController<List<int>> streamController = StreamController();

  loadList() {
    _model.loadList();
    _model.list.then((value) => streamController.add(value));
  }
}