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
  ConnectionController conection;
  @override
  //! scroll do color picker conflitando com scroll do list view
  Widget build(BuildContext context) {
    // conection = ConnectionController(
    //   broker: widget.controle.broker,
    //   topic: widget.controle.topic,
    //   onMensage: (String text){
    //     print(text);
    //   }
    // );
    // conection.startConnection();
    return CardTemplate(
      controle: widget.controle,
      controleDelete: widget.delete,
      controleUpdate: widget.update,

      childWidget: Center(
        child: CircleColorPicker(
          initialColor: Colors.blue,
          onClick: (){
            conection.publishMessage("teste");
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