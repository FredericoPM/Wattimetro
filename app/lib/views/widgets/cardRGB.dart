import 'package:app/controllers/conection.dart';
import 'package:app/models/controle.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';

import 'colorPicker.dart';

class CardRGB extends StatefulWidget {
  Controle controle;
  void Function(Controle controle) delete;
  void Function(Controle controle) update;
  CardRGB({this.controle, this.delete, this.update});
  @override
  _CardRGBState createState() => _CardRGBState();
}

class _CardRGBState extends State<CardRGB> {
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
  //! scroll do color picker conflitando com scroll do list view
  Widget build(BuildContext context) {
    
    return CardTemplate(
      controle: widget.controle,
      controleDelete: widget.delete,
      controleUpdate: widget.update,

      childWidget: Center(
        child: CircleColorPicker(
          initialColor: Colors.blue,
          state: _state,
          onClick: (){
            
          },
          onChanged: (color){
            // setState(() {
            //   atualColor = color;
            // });
          },
          size: const Size(300, 300),
          strokeWidth: 4,
          thumbSize: 36,
        ),
      ),
    );
  }
}