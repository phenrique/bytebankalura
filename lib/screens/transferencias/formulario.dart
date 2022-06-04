import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = "Criando transferência";

const _rotuloEditorNumeroConta = "Número da conta";
const _dicaEditorNumeroConta = "1234-5";

const _rotuloEditorValor = "Valor";
const _dicaEditorValor = "0.00";

const _textoBotao = "Confirmar";

const _transferenciaRecebidaSucesso = "Transferência recebida com sucesso.";

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      Transferencia transferencia = Transferencia(valor, numeroConta);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(_transferenciaRecebidaSucesso),
        duration: Duration(milliseconds: 500),
      ));
      Navigator.pop(context, transferencia);
    }
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(children: [
          Editor(
              controlador: widget._controllerCampoNumeroConta,
              rotulo: _rotuloEditorNumeroConta,
              dica: _dicaEditorNumeroConta),
          Editor(
              controlador: widget._controllerCampoValor,
              rotulo: _rotuloEditorValor,
              dica: _dicaEditorValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            onPressed: () => widget._criarTransferencia(context),
            child: const Text(_textoBotao),
          )
        ]),
      ),
    );
  }
}
