import 'package:app/controllers/conection.dart';
import 'package:app/models/controle.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';


class CardOnOff extends StatefulWidget {
  Controle controle;
  void Function(Controle controle) delete;
  void Function(Controle controle) update;
  CardOnOff({this.controle, this.delete, this.update});
  @override
  _CardOnOffState createState() => _CardOnOffState();
}

class _CardOnOffState extends State<CardOnOff> {
  bool _state = false;
  ConnectionController conection;
  @override
  void initState() {
    conection = ConnectionController(
      broker: widget.controle.broker,
      topic: widget.controle.topic,
      onMensage: (String text){
        String controleId = "C${widget.controle.id}";
        if(text.substring(0, controleId.length) == controleId){
          setState(() {
            _state = text.substring(controleId.length+1) == '1';
          });
        }
      }
    );
    conection.startConnection();
  }
  Widget build(BuildContext context) {
    print(widget.controle.id);
    return CardTemplate(
      controle: widget.controle,
      controleDelete: widget.delete,
      controleUpdate: widget.update,
      childWidget:RawMaterialButton(
        onPressed: () {
          setState(() {
            _state = !_state;
          });
        },
        elevation: 2.0,
        fillColor: Theme.of(context).accentColor,
        child: Icon(
          _state ? Icons.lightbulb : Icons.lightbulb_outline,
          size: 35.0,
          color: Theme.of(context).cardColor,
        ),
        padding: EdgeInsets.all(30),
        shape: CircleBorder(),
      ),
    );
  }
}