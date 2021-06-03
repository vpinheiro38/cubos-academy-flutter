import 'package:aula16/form_viewmodel.dart';
import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  final _viewModel = FormViewModel();

  @override
  void initState() {
    _viewModel.loadCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Nome'),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Campo Nome é obrigatório!';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            _viewModel.updateName(text);
                          },
                        ),
                        TextFormField(
                            decoration: InputDecoration(hintText: 'Sobrenome'),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Campo Sobrenome é obrigatório!';
                              }
                              return null;
                            },
                            onChanged: (text) {
                              _viewModel.updateSurname(text);
                            }),
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _viewModel.deleteCurrentUser();
                                    _viewModel.loadCurrentUser();
                                  },
                                  child: Text('Deletar')),
                              ElevatedButton(
                                  onPressed: () {
                                    final isValid =
                                        _formKey.currentState!.validate();

                                    if (isValid) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Olá ${_viewModel.name} ${_viewModel.surname}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: Text('Salvar'),
                                                  onPressed: () {
                                                    _viewModel.saveUser();
                                                    _viewModel
                                                        .loadCurrentUser();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Text('Validar'))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                          child: StreamBuilder<String>(
                            stream: _viewModel.streamController.stream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.active) {
                                return CircularProgressIndicator();
                              }

                              if (snapshot.hasData) {
                                return Text(snapshot.data ?? '');
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
