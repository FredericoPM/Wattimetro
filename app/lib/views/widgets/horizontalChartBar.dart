import 'dart:math';

import 'package:flutter/material.dart';

class HorizontalChartBar extends StatefulWidget {
  String label;
  double value;
  HorizontalChartBar({this.label, this.value});
  @override
  _HorizontalChartBarState createState() => _HorizontalChartBarState();
}

class _HorizontalChartBarState extends State<HorizontalChartBar> {
  var randon = Random();
  @override
  Widget build(BuildContext context) {
    var barSize = MediaQuery.of(context).size.width*0.6;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w300,
          )
        ),
        Stack(
          children: [
            Container(
              width: barSize,
              height: 21,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.5)),
              ),
            ),
            Container(
              width: barSize*randon.nextDouble(),
              height: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.5)),
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
        Text(
          widget.value.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w300,
          )
        )
      ],
    );
  }
}