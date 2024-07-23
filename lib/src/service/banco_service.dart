import 'dart:convert';

import 'package:f/src/service/service_base.dart';
import 'package:http/http.dart' show Client;
import 'package:f/src/model/banco.dart';

// classe reponsavel por requisições ao servidor REST
class BancoService extends ServiceBase {
  var cliente = Client();

  Future<List<Banco>> consultarList() async {
    var listaBanco = List<Banco>();

    // pega a lista no servidor
    final response = await cliente.get('$endpoint/banco/');
    if (response.statusCode == 200) {
      var responseConvertido = json.decode(response.body) as List<dynamic>;

      for (var bancoJson in responseConvertido) {
        listaBanco.add(Banco.fromJson(bancoJson));
      }
      return listaBanco;
    } else {
      return null;
    }
  }

  Future<Banco> consultarObjeto(int id) async {
    // pega o objeto do servidor pelo id
    final response = await cliente.get('$endpoint/banco/$id');
    if (response.statusCode == 200) {
      var bancoJson = json.decode(response.body);
      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<Banco> inserir(Banco banco) async {
    final response = await cliente.post('$endpoint/banco,',
        headers: {"content-type": "application/json"},
        body: bancoEcondeJson(banco));
    if (response.statusCode == 200) {
      var bancoJson = json.decode(response.body);
      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<Banco> alterar(Banco banco) async {
    final response = await cliente.put('$endpoint/banco),',
        headers: {"content-type": "application/json"},
        body: bancoEcondeJson(banco));
    if (response.statusCode == 200) {
      var bancoJson = json.decode(response.body);
      return Banco.fromJson(bancoJson);
    } else {
      return null;
    }
  }

  Future<bool> excluir(int id) async {
    final response = await cliente.delete(
      '$endpoint/banco/$id',
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
