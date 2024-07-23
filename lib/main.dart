import 'package:f/src/infra/locator.dart';
import 'package:f/src/infra/rotas.dart';
import 'package:f/src/view_model/banco_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Adicionado import do provider

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => locator<BancoViewModel>()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: '/',
        title: 'ERP F',
        onGenerateRoute: Rotas.definirRotas,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
