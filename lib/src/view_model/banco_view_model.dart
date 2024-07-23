import 'package:f/src/infra/locator.dart';
import 'package:f/src/model/banco.dart';
import 'package:f/src/service/banco_service.dart';
import 'package:flutter/cupertino.dart';

class BancoViewModel extends ChangeNotifier {
  BancoService _bancoService = locator<BancoService>();

  List<Banco> listaBanco;
  BancoViewModel() {
    consultarList();
  }

  Future<List<Banco>> consultarList() async {
    listaBanco = await _bancoService.consultarList();
    notifyListeners();
    return listaBanco;
  }

  Future<Banco> consultarObjeto(int id) async {
    var result = await _bancoService.consultarObjeto(id);
    notifyListeners();
    return result;
  }

  Future<Banco> inserir(Banco banco) async {
    var result = await _bancoService.inserir(banco);
    notifyListeners();
    return result;
  }

  Future<Banco> alterar(Banco banco) async {
    var result = await _bancoService.alterar(banco);
    notifyListeners();
    return result;
  }

  Future<bool> excluir(int id) async {
    bool result = await _bancoService.excluir(id);
    notifyListeners();
    return result;
  }
}
