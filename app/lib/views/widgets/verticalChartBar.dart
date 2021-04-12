import 'package:flutter/material.dart';

class VerticalChartBar extends StatelessWidget {
  final String label;
  double fillPercentage;
  VerticalChartBar({this.label, this.fillPercentage}){
    if(fillPercentage < 0.15){
      fillPercentage = 0.15;
    }
  }
  @override
  Widget build(BuildContext context) {
    print(fillPercentage);
    return Column(
      children: [
        Container(
          height: 130,
          width: 21,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 21,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.5)),
                ),
              ),
              Container(
                width: 21,
                height: 130*fillPercentage,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.5)),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
        Text(label, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),),
      ],
    );
  }
}