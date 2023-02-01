import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'textoPadrao.dart';
import 'viraCheck.dart';
import 'winnerScreen.dart';
import 'constantes.dart';
import 'drawerMenu.dart';
import 'iconColor.dart';
import 'iconePadrao.dart';

//declaração de variáveis
enum Player {
  p1,
  p2,
}

const snackBar = SnackBar(
  backgroundColor: Colors.black45,
  content: Text(
    'Alterações realizadas.',
    style: kEstiloDoTextoSnackBar,
  ),
);

const String titulo = 'Marcador de pontos';
String nomeVencedor = '';
String nomeP2 = 'Eles';
String nomeP1 = 'Nós';

bool mudarTelaP1 = false;
bool mudarTelaP2 = false;
bool infoViraP1 = false;
bool infoViraP2 = false;

int pontosP1 = 0;
int pontosP2 = 0;
int valorVira = 9;
int placarP1 = 0;
int placarP2 = 0;
//fim da declaração de variáveis

class TrucoApp extends StatefulWidget {
  const TrucoApp({Key? key}) : super(key: key);

  @override
  State<TrucoApp> createState() => _TrucoAppState();
}

class _TrucoAppState extends State<TrucoApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        'winnerScreen' : (context) => const WinnerScreen(),
        'tela_principal' : (context) => const TrucoApp(),
      },
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
          title: const Text(titulo),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.settings),
                ),
              ),
            ],
        ),

          endDrawer: DrawerMenu(
            confirmar: (){
              setState(() {
                //Dando confirmação (feedback) pro usuario
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
              },
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black54,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                icon: Text(
                  placarP1.toString(),
                  style: const TextStyle(
                      fontSize: 35,
                  ),
                ),
                label: nomeP1,
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: (){
                    setState(() {
                      placarP1 = 0;
                      placarP2 = 0;
                    });
                  },
                  child: const Text(
                    'X',
                    style: TextStyle(
                        fontSize: 35,
                    ),
                  ),
                ),
                label: 'Zerar',
              ),
              BottomNavigationBarItem(
                icon: Text(
                  placarP2.toString(),
                  style: const TextStyle(
                      fontSize: 35,
                  ),
                ),
                label: nomeP2,
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextoPadrao(
                      texto: nomeP1,
                      estilo: kEstiloDosNomes,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    TextoPadrao(
                      texto: nomeP2,
                      estilo: kEstiloDosNomes,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconVira(equipe: Player.p1),
                    Text(
                      'Vira a $valorVira',
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    IconVira(equipe: Player.p2),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconePadrao(
                      icone: const Icon(FontAwesomeIcons.plus),
                      pressionar: () {
                        setState(() {
                          if (pontosP1 >= valorVira - 1) {
                            pontosP1 = 0;
                            if(infoViraP1 == true){
                              nomeVencedor = nomeP1;
                              placarP1++;
                              Navigator.pushReplacementNamed(
                                  context,
                                  'winnerScreen',
                              );
                            }
                            else {
                              infoViraP1 = true;
                            }
                          }
                          else {
                            pontosP1++;
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    IconePadrao(
                      icone: const Icon(FontAwesomeIcons.plus),
                      pressionar: () {
                        setState(() {
                          if (pontosP2 >= valorVira - 1) {
                            pontosP2 = 0;
                            if(infoViraP2 == true){
                              nomeVencedor = nomeP2;
                              placarP2++;
                              Navigator.pushReplacementNamed(
                                  context,
                                  'winnerScreen',
                              );
                            }
                            else {
                              infoViraP2 = true;
                            }
                          }
                          else {
                            pontosP2++;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextoPadrao( //Mostrando os pontos do player1
                      texto: pontosP1.toString(),
                      estilo: viraCheck(Player.p1),
                    ),
                    TextoPadrao( //Mostrando os pontos do player2
                      texto: pontosP2.toString(),
                      estilo: viraCheck(Player.p2),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconePadrao(
                      icone: const Icon(FontAwesomeIcons.minus),
                      pressionar: () {
                        setState(() {
                          if(pontosP1 == 0 && infoViraP1 == true){
                            infoViraP1 = false;
                            pontosP1 = valorVira;
                          }
                          pontosP1 > 0 ? pontosP1-- : null;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    IconePadrao(
                      icone: const Icon(FontAwesomeIcons.minus),
                      pressionar: () {
                        setState(() {
                          if(pontosP2 == 0  && infoViraP2 == true){
                            infoViraP2 = false;
                            pontosP2 = valorVira;
                          }
                          pontosP2 > 0 ? pontosP2-- : null;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





