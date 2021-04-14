import 'package:app/views/sideMenu.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:app/views/widgets/dataInput.dart';
import 'package:app/views/widgets/searchInput.dart';
import 'package:flutter/material.dart';

class ControllerForm extends StatefulWidget {
  @override
  _ControllerFormState createState() => _ControllerFormState();
}

class _ControllerFormState extends State<ControllerForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
            "Novo Controle", 
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28
            ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30),
            onPressed: (){

            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              DataImput(

              ),
            ],
          ),
        ),
      ),
    );
  }
}