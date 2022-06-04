import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: this.controlador,
        style: const TextStyle(
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
            labelText: this.rotulo,
            hintText: this.dica,
            icon: icone == null ? null : Icon(icone)),
        keyboardType: TextInputType.number,
      ),
    );
  }
}