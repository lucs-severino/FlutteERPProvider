import 'package:flutter/material.dart';

class BancoPersistePage extends StatefulWidget {
  BancoPersistePage({Key key}) : super(key: key);

  @override
  _BancoPersistePageState createState() => _BancoPersistePageState();
}

class _BancoPersistePageState extends State<BancoPersistePage> {
  final _formKey = GlobalKey<FormState>();
  String _codigo;
  String _nome;
  String _url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistir Banco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Código'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira o código';
                  }
                  return null;
                },
                onSaved: (value) => _codigo = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira a URL';
                  }
                  return null;
                },
                onSaved: (value) => _url = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Faça algo com os dados salvos, como persistir no banco de dados
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Dados salvos com sucesso')),
                    );
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
