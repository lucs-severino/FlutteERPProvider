import 'package:f/src/model/banco.dart';
import 'package:f/src/view_model/banco_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Adicionado import do provider

class BancoListaPage extends StatefulWidget {
  @override
  BancoListaPageState createState() => BancoListaPageState();
}

class BancoListaPageState extends State<BancoListaPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    var listaBanco = Provider.of<BancoViewModel>(context).listaBanco;

    final BancoDataSource _bancoDataSource =
        BancoDataSource(listaBanco, context);

    void _sort<T>(
        Comparable<T> getField(Banco banco), int columnIndex, bool ascending) {
      _bancoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - Banco'),
        actions: const <Widget>[],
      ),
      body: Scrollbar(
        child: listaBanco == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  PaginatedDataTable(
                    header: const Text('Relação - Banco'),
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    columns: <DataColumn>[
                      DataColumn(
                        numeric: true,
                        label: const Text('Id'),
                        tooltip: 'Id',
                        onSort: (int columnIndex, bool ascending) => _sort<num>(
                            (Banco banco) => banco.id, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Código'),
                        tooltip: 'Código',
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>((Banco banco) => banco.codigo,
                                columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Nome'),
                        tooltip: 'Nome',
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>((Banco banco) => banco.nome,
                                columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('URL'),
                        tooltip: 'URL',
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>((Banco banco) => banco.url,
                                columnIndex, ascending),
                      ),
                    ],
                    source: _bancoDataSource,
                  ),
                ],
              ),
      ),
    );
  }
}

class BancoDataSource extends DataTableSource {
  final List<Banco> listaBanco;
  final BuildContext context;

  BancoDataSource(this.listaBanco, this.context);

  void sort<T>(Comparable<T> getField(Banco banco), bool ascending) {
    listaBanco.sort((Banco a, Banco b) {
      if (!ascending) {
        final Banco c = a;
        a = b;
        b = c;
      }
      Comparable<T> aValue = getField(a);
      Comparable<T> bValue = getField(b);

      if (aValue == null) aValue = '' as Comparable<T>;
      if (bValue == null) bValue = '' as Comparable<T>;

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listaBanco.length) return null;
    final Banco banco = listaBanco[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${banco.id ?? ''}'), onTap: () {
          detalharBanco(banco, context);
        }),
        DataCell(Text('${banco.codigo ?? ''}'), onTap: () {
          detalharBanco(banco, context);
        }),
        DataCell(Text('${banco.nome ?? ''}'), onTap: () {
          detalharBanco(banco, context);
        }),
        DataCell(Text('${banco.url ?? ''}'), onTap: () {
          detalharBanco(banco, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaBanco.length ?? 0;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void detalharBanco(Banco banco, BuildContext context) {
  Navigator.pushNamed(
    context,
    '/bancoDetalhe',
    arguments: banco,
  );
}
