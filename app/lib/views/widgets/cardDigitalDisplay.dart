import 'package:app/models/display.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class CardDigitalDisplay extends StatefulWidget {
  Display display;
  void Function(Display display) delete;
  void Function(Display controle) update;
  CardDigitalDisplay({this.display, this.delete, this.update});
  @override
  _CardDigitalDisplayState createState() => _CardDigitalDisplayState();
}

class _CardDigitalDisplayState extends State<CardDigitalDisplay> {
  double _sliderState = 0;
  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      display: widget.display,
      displayDelete: widget.delete,
      displayUpdate: widget.update,
      childWidget:Container(
        height: 100,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.5)),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  AutoSizeText(
                    "88.8",
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontFamily: "DigitalMono",
                      fontSize: 95,
                    ),
                  ),
                  AutoSizeText(
                    "18.5",
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: "DigitalMono",
                      fontSize: 95,
                    ),
                  ),
                ],
              ),
              Text(
                "°C",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}