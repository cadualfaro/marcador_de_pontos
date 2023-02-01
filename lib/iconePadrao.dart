import 'package:flutter/material.dart';

class IconePadrao extends StatelessWidget {

  Function pressionar;
  Widget icone;

  IconePadrao({super.key, required this.pressionar, required this.icone});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){pressionar.call();},
      iconSize: 100.0,
      icon: icone,
    );
  }
}