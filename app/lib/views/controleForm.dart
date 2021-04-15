import 'package:app/models/controle.dart';
import 'package:app/views/widgets/dataInput.dart';
import 'package:app/views/widgets/dropDownDataInput.dart';
import 'package:flutter/material.dart';

class ControleForm extends StatefulWidget {
  void Function(Controle controle) add;
  void Function() delete;
  void Function() update;
  Controle controle;
  ControleForm({this.add, this.delete, this.controle,this.update});
  @override
  _ControleFormState createState() => _ControleFormState();
}

class _ControleFormState extends State<ControleForm> {
  //! ao tentar submeter o formulario vazio ocorre um problema visual com campos
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _brokerController = TextEditingController();
  TextEditingController _topicoController = TextEditingController();

  void goBack(var context){
    Navigator.pop(context);
  }

  @override
  void initState() { 
    super.initState();
    if(widget.controle != null){
      _nomeController.text = widget.controle.name;
      _tipoController.text = widget.controle.type;
      _brokerController.text = widget.controle.broker;
      _topicoController.text = widget.controle.topic;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, size: 30),
          onPressed: () => goBack(context),
        ),
        title: Text(
            widget.delete == null ? "Novo Controle" : "Editar Controle", 
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28
            ),
        ),
        actions: widget.delete != null ? [
          IconButton(
            icon: Icon(Icons.delete, color: Theme.of(context).errorColor,size: 30,),
            onPressed: (){
              widget.delete();
              goBack(context);
            }
          )
        ] 
        : null,
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
                      DropDownDataInput(
                        labelText: "Tipo do Controle",
                        controller: _tipoController,
                        errorText: "erro",
                        options: [
                          "On/Off",
                          "Slider",
                          "RGB"
                        ],
                      ),
                      SizedBox(height:20),
                      DataImput(
                        labelText: "Broker",
                        errorText: "erro",
                        controller: _brokerController,
                      ),
                      SizedBox(height:20),
                      DataImput(
                        labelText: "Topico",
                        errorText: "erro",
                        controller: _topicoController,
                      ),
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
                         if(widget.update == null){
                          widget.add(
                            Controle(
                              name: _nomeController.text,
                              type: _tipoController.text,
                              broker: _brokerController.text,
                              topic: _topicoController.text
                            )
                          );
                         }else{
                           widget.update();
                         }
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