import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tela_principal.dart';

class IconVira extends StatelessWidget {

  Player equipe;

  IconVira({required this.equipe});

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.award,
      color: colorCheck(equipe),
      shadows: [Shadow(blurRadius: 30, color: colorCheck(equipe))],
      size: 40,
    );
  }
}

Color colorCheck(Player equipe) {
  if (equipe == Player.p1) {
    if (infoViraP1) {
      return Colors.white;
    }
    else {
      return Colors.transparent;
    }
  }
  if (equipe == Player.p2) {
    if (infoViraP2) {
      return Colors.white;
    }
    else {
      return Colors.transparent;
    }
  }
  return Colors.transparent;
}