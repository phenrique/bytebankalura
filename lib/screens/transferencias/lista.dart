import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget {
  final _transferencias = <Transferencia>[];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        centerTitle: false,
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final Transferencia transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );

          future.then((transferenciaRecebida) =>
              _atualizaTransferencia(transferenciaRecebida, context));
        },
      ),
    );
  }

  void _atualizaTransferencia(
      Transferencia? transferenciaRecebida, BuildContext context) {
    setState(() => widget._transferencias.add(transferenciaRecebida!));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(transferenciaRecebida.toString()),
      backgroundColor: Colors.blueGrey,
    ));
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
        onLongPress: () {},
      ),
    );
  }
}
