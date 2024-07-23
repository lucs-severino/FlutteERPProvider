import 'package:f/src/model/banco.dart';
import 'package:f/src/view/page/cadastro/banco/banco_detalhe_page.dart';
import 'package:f/src/view/page/cadastro/banco/banco_lista_page.dart';
import 'package:f/src/view/page/cadastro/banco/banco_persite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rotas {
  static Route<dynamic> definirRotas(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BancoListaPage());
      case '/bancoLista':
        return MaterialPageRoute(builder: (_) => BancoListaPage());
      case '/bancoDetalhe':
        var banco = settings.arguments as Banco;
        return MaterialPageRoute(
            builder: (_) => BancoDetalhePage(
                  banco: banco,
                ));
      case '/bancoersite':
        return MaterialPageRoute(builder: (_) => BancoPersistePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('Nem uma rota definida para {$settings.name}'),
                )));
    }
  }
}
