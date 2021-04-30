import 'dart:math';
import 'package:app/controllers/conection.dart';
import 'package:app/models/display.dart';
import 'package:app/views/barChartModal.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:app/views/widgets/verticalChartBar.dart';
import 'package:flutter/material.dart';

class CardBarChart extends StatefulWidget {
  Display display;
  void Function(Display display) delete;
  void Function(Display controle) update;
  CardBarChart({this.display, this.delete, this.update});
  @override
  _CardBarChartState createState() => _CardBarChartState();
}

class _CardBarChartState extends State<CardBarChart> {
  var randon = Random();
   void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0)
        ),
      ),
      context: context,
      builder: (context) {
        return BarChardtModal();
      },
    );
  }
  ConnectionController conection;
  @override
  void initState() {
    conection = ConnectionController(
      broker: widget.display.broker,
      topic: widget.display.topic,
      onMensage: (String text){
        String displayId = "D${widget.display.id}";
        if(text.substring(0, displayId.length) == displayId){
          
        }
      }
    );
    conection.startConnection();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheet(context),
      child: CardTemplate(
        display: widget.display,
        displayDelete: widget.delete,
        displayUpdate: widget.update,
        childWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              for(int i = 0; i< 7; i++)
                VerticalChartBar(label: i.toString(), fillPercentage: randon.nextDouble().abs()),
            ],
        ),
      ),
    );
  }
}