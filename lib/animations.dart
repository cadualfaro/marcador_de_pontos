import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

enum Chave {
  vitoria,
  snackbar,
  textoCancelar,
}

class Animations extends StatelessWidget {

  String winnerTxt;
  Chave chave;

  Animations({super.key, required this.winnerTxt, required this.chave});

  @override
  Widget build(BuildContext context) {
    return animation(chave);
  }

  AnimatedTextKit animation(Chave chave){
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
            winnerTxt,
            textStyle: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            speed: const Duration(milliseconds: 250),
            curve: Curves.bounceOut
        ),
      ],
    );
  }



}
