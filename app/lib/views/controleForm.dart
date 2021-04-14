import 'package:app/views/widgets/dataInput.dart';
import 'package:flutter/material.dart';

class ControleForm extends StatefulWidget {
  @override
  _ControleFormState createState() => _ControleFormState();
}

class _ControleFormState extends State<ControleForm> {
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
          padding: const EdgeInsets.fromLTRB(20,20,20,28),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-AppBar().preferredSize.height-148,
                child: ListView(
                  children: [
                    SizedBox(height:8),
                    DataImput(
                      labelText: "Nome",
                    ),
                  ],
                ),
              ),
              SizedBox(height:28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: Theme.of(context).errorColor,
                    onPressed: (){},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 48,
                      width: 130,
                      child: Center(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            fontSize: 21,
                            color: Color(0xFFFCF8EF),
                          ),
                        )
                      )
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xFF6ACB67),
                    onPressed: (){},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 48,
                      width: 130,
                      child: Center(
                        child: Text(
                          "Concluir",
                          style: TextStyle(
                            fontSize: 21,
                            color: Color(0xFFFCF8EF),
                          ),
                        )
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}