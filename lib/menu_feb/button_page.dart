import 'package:flutter/material.dart';
import 'package:my_app/menu_feb/feb_menu_button.dart';


class ButtonPage extends StatefulWidget{
  const ButtonPage({Key? key}) :super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState(); 
}

class _ButtonPageState extends State<ButtonPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      floatingActionButton: FebMnuButton(),
    );
  }
}
