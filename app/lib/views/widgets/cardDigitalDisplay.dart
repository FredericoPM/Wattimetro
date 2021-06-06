import 'package:app/controllers/conection.dart';
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
  String _displayValue = "0.0";
  ConnectionController conection;
  @override
  void initState() {
    conection = ConnectionController(
      broker: widget.display.broker,
      topic: widget.display.topic,
      onMensage: (String text){
        print(text);
        String displayId = "D${widget.display.id}";
        if(text.substring(0, displayId.length) == displayId && text.substring(displayId.length+1, displayId.length+8) == "digital"){
          setState(() {
            _displayValue = text.substring(displayId.length+8);
          });
        }
      }
    );
    conection.startConnection();
  }
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
                    _displayValue.replaceAll(RegExp('[012345679]'), '8'),
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontFamily: "DigitalMono",
                      fontSize: 95,
                    ),
                  ),
                  AutoSizeText(
                    _displayValue,
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
                widget.display.measurement,
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