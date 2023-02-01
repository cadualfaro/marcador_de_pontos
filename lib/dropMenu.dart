import 'package:flutter/material.dart';
import 'tela_principal.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({Key? key}) : super(key: key);

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {

  List<int> items = [12, 9];
  int itemSelecionado = valorVira;

  @override
  Widget build(BuildContext context) {

    Color? corDoMenu = Colors.grey[900];
    int elevationdoMenu = 1;

    return SizedBox(
      height: 55,
      width: 25,
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(15),//define a borda do menu
        elevation: elevationdoMenu,
        dropdownColor: corDoMenu,
        decoration: InputDecoration(
          labelText: 'Valor da vira',
          border: OutlineInputBorder(//altera a borda do campo quando ele está selecionado
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Colors.white,
                width: 0.5,
            ),
          ),

          enabledBorder: OutlineInputBorder(//altera a borda do campo quando ele não está selecionado
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 0.5),
          ),
        ),

          value: itemSelecionado,
          items: items.map(
                  (item) => DropdownMenuItem<int>(
                    value: item,
                    child: Text(item.toString()),
                  ),
          ).toList(),

          onChanged: (item) {
              itemSelecionado = item!;
              valorVira = item;

          },

      ),
    );
  }
}
