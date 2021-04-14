import 'dart:math';
import 'package:app/views/barChartModal.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:app/views/widgets/verticalChartBar.dart';
import 'package:flutter/material.dart';

class CardBarChart extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheet(context),
      child: CardTemplate(
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