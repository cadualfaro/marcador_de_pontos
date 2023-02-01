import 'package:flutter/material.dart';

class TextoPadrao extends StatelessWidget {

  final String texto;
  final TextStyle estilo;

  const TextoPadrao({super.key, required this.texto, required this.estilo});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: estilo,
    );
  }
}