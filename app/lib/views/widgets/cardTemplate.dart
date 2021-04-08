import 'package:flutter/material.dart';

import 'colorPicker.dart';

class CardTemplate extends StatefulWidget {
  String type;
  CardTemplate({this.type});
  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  double _sliderState = 0;
  //! scroll do color picker conflitando com scroll do list view
  _rgb(){
    return Center(
      child: CircleColorPicker(
        initialColor: Colors.blue,
        onChanged: (color){
          // setState(() {
          //   atualColor = color;
          // });
        },
        size: const Size(300, 300),
        strokeWidth: 4,
        thumbSize: 36,
      ),
      );
  }
  _onOffButton(var accentColor, var cardColor){
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: accentColor,
      child: Icon(
        Icons.lightbulb_outline,
        size: 35.0,
        color: cardColor,
      ),
      padding: EdgeInsets.all(30),
      shape: CircleBorder(),
    );
  }
  _slider(var accentColor){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.lightbulb_outline,
          color: accentColor,
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
            activeColor: accentColor,
            inactiveColor: Color(0xFF716601),
          ),
        ),
        Icon(
          Icons.lightbulb,
          color: accentColor,
        ),
      ],
    );
  }

  _selectContent({var accentColor, var cardColor}){
    switch (widget.type) {
      case "on/off":
        return _onOffButton(accentColor, cardColor);
      break;
      case "slider":
        return _slider(accentColor);
      break;
      case "rgb":
        return _rgb();
      break; 
      default:
        return Text("ERRO: type undefined '${widget.type}'");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 16, 6, 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.create, color: Theme.of(context).accentColor, size: 28,),
                  onPressed: (){}
                ),
                Text(
                  "Teste ${widget.type}",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Theme.of(context).accentColor, size: 28), 
                  onPressed: (){}
                )
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:9, vertical:0),
              child: _selectContent(
                accentColor: Theme.of(context).accentColor,
                cardColor: Theme.of(context).cardColor
              ),
            ), 
          ],
        ),
      ),
    );
  }
}