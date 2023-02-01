import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tela_principal.dart';
import 'dividerPadrao.dart';
import 'dropMenu.dart';

class DrawerMenu extends StatelessWidget {

  Function confirmar;

  DrawerMenu({super.key, required this.confirmar});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      width: double.maxFinite,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            SizedBox(
              height: 80.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xff676767),
                  border:  Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Configurações',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //fim do header configurações

            const Center(
              heightFactor: 2.0,
                child: Text(
                    'Alterar o valor da vira',
                ),
            ),
             const ListTile(
              leading: Icon(//definindo icone ao lado do Dropbutton da vira
                FontAwesomeIcons.award,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 30, color: Colors.white)],
                size: 25,
              ),
              title: DropMenu(),
            ),
            const DividerPadrao(),
            const Center(
              heightFactor: 2.0,
              child: Text(
                'Alterar nomes dos jogadores',
                style: TextStyle(),
              ),
            ),
            ListTile(
              leading: const Icon(//definindo icone do player1
                FontAwesomeIcons.addressCard,
              ),
              title: TextField(
                maxLength: 5,
                onChanged: (String value) {
                  nomeP1 = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Nós',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(//definindo icone do player2
                FontAwesomeIcons.addressCard,
              ),
              title: TextField(
                maxLength: 5,
                onChanged: (String value) {
                    nomeP2 = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Eles',
                ),
              ),
            ),

            Center(
              child: Builder(
                builder: (context) => OutlinedButton(
                  child: const Text(
                      'Confirmar alterações',
                      style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    //chamando o metodo recebido qnd clica em confirmar
                    confirmar.call();
                    // Fechando o drawer menu ao clicar em confirmar
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            const DividerPadrao(),
            Row(
              children: [
                Image.asset(
                  'imagens/cartas.png',
                  width: 100,
                  height: 120,
                  alignment: AlignmentDirectional.bottomStart,
                ),
                const Text(
                  'Criado por: Cadu Alfaro\n'
                      '2023\n'
                      'Versão: 2.1.0',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            DividerPadrao(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                    'Arraste para cancelar ->',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}