import 'package:app/models/display.dart';
import 'package:app/views/widgets/dataInput.dart';
import 'package:flutter/material.dart';

import 'widgets/dropDownDataImput.dart';

class DisplayForm extends StatefulWidget {
  void Function(Display display) add;
  void Function(Display display) delete;
  DisplayForm({this.add, this.delete});
  @override
  _DisplayFormState createState() => _DisplayFormState();
}

class _DisplayFormState extends State<DisplayForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _brokerController = TextEditingController();
  TextEditingController _topicoController = TextEditingController();
  TextEditingController _medidaController = TextEditingController();
  void goBack(var context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, size: 30),
          onPressed: () => goBack(context),
        ),
        title: Text(
            "Novo Display", 
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28
            ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,28),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-AppBar().preferredSize.height-148,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(height:8),
                      DataImput(
                        labelText: "Nome",
                        controller: _nomeController,
                        errorText: "erro",
                      ),
                      SizedBox(height:20),
                      DropDownDataImput(
                        labelText: "Tipo do Display",
                        controller: _tipoController,
                        errorText: "erro",
                        options: [
                          "Digital",
                          "Grafico",
                        ],
                      ),
                      SizedBox(height:20),
                      DataImput(
                        labelText: "Broker",
                        controller: _brokerController,
                        errorText: "erro",
                      ),
                      SizedBox(height:20),
                      DataImput(
                        labelText: "Topico",
                        controller: _topicoController,
                        errorText: "erro",
                      ),
                      SizedBox(height:20),
                      DataImput(
                        labelText: "Unidade de medida",
                        controller: _medidaController,
                        errorText: "erro",
                      ),
                      SizedBox(height:20),
                    ],
                  ),
                ),
              ),
              SizedBox(height:28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: Theme.of(context).errorColor,
                    onPressed: () => goBack(context),
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
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                         widget.add(
                           Display(
                             name: _nomeController.text,
                             type: _tipoController.text,
                             broker: _brokerController.text,
                             topic: _topicoController.text,
                             measurement: _medidaController.text
                           )
                         );
                         Navigator.pop(context);
                       }
                    },
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