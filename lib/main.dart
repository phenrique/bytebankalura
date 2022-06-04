import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen[900],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.tealAccent[700]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.tealAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencia(),
    );
  }
}
