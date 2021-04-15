import 'package:app/models/controle.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';


class CardOnOff extends StatefulWidget {
  Controle controle;
  void Function(Controle controle) delete;
  CardOnOff({this.controle, this.delete});
  @override
  _CardOnOffState createState() => _CardOnOffState();
}

class _CardOnOffState extends State<CardOnOff> {
  double _sliderState = 0;
  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      controle: widget.controle,
      controleDelete: widget.delete,
      childWidget:RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.lightbulb_outline,
          size: 35.0,
          color: Theme.of(context).cardColor,
        ),
        padding: EdgeInsets.all(30),
        shape: CircleBorder(),
      ),
    );
  }
}