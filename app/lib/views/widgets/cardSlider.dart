import 'package:app/views/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';


class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double _sliderState = 0;
  @override
  Widget build(BuildContext context) {
    return CardTemplate(
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