import 'package:app/models/controle.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';


class CardSlider extends StatefulWidget {
  Controle controle;
  void Function(Controle controle) delete;
  void Function(Controle controle) update;
  CardSlider({this.controle, this.delete, this.update});
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double _sliderState = 0;
  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      controle: widget.controle,
      controleDelete: widget.delete,
      controleUpdate: widget.update,
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.lightbulb_outline,
            color: Theme.of(context).accentColor,
          ),
          Flexible(
            flex: 1,
            child: Slider(
              value: _sliderState,
              min: 0,
              max: 1023,
              onChanged: (value){
                setState(() {
                  _sliderState = value;
                });
              },
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Color(0xFF716601),
            ),
          ),
          Icon(
            Icons.lightbulb,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}