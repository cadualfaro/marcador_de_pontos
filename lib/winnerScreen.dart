import 'package:flutter/material.dart';
import 'tela_principal.dart';
import 'animations.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({Key? key}) : super(key: key);

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {

  Future<bool?> showConfirmationDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
                'Deseja sair sem salvar?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  'Cancelar',
                ),
              ),
              OutlinedButton(
                // onPressed: () => Navigator.pop(context, true),
                onPressed: () {
                  infoViraP1 = false;
                  infoViraP2 = false;
                  pontosP1 = 0;
                  pontosP2 = 0;
                  Navigator.pushReplacementNamed(context, 'tela_principal', arguments:  true);
                },
                child: const Text(
                  'Sair',
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WillPopScope(
        onWillPop: () async {
          final confirmation = await showConfirmationDialog();
          return confirmation ?? false;
        },

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Vitória!'),
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_rounded,
              ),
              onTap: () {
                infoViraP1 = false;
                infoViraP2 = false;
                pontosP1 = 0;
                pontosP2 = 0;
                Navigator.pushReplacementNamed(context, 'tela_principal');
              },
            ),
          ),
          body: Center(
            child: Animations(
              winnerTxt: 'Equipe vencedora:\n$nomeVencedor',
              chave: Chave.vitoria,
            ),
          ),
        ),
      ),
    );
  }
}
