import 'package:flutter/material.dart';
import 'constantes.dart';
import 'tela_principal.dart';

//passando parametro para saber se ta verificando o texto referente a pontuacao de NOS ou ELES
TextStyle viraCheck(Player equipe){
  if(equipe == Player.p1){
    if(infoViraP1){
      return kEstiloDoTextoVira;
    }
    else{
      return kEstiloDoTexto;
    }
  }
  if(equipe == Player.p2){
    if(infoViraP2){
      return kEstiloDoTextoVira;
    }
    else{
      return kEstiloDoTexto;
    }
  }
  return kEstiloDoTexto;
}