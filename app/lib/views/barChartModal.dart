import 'package:app/views/widgets/horizontalChartBar.dart';
import 'package:flutter/material.dart';

class BarChardtModal extends StatefulWidget {

  @override
  _BarChardtModalState createState() => _BarChardtModalState();
}

class _BarChardtModalState extends State<BarChardtModal> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 65,
            width: MediaQuery.of(context).size.width,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              "Teste",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 15),
          for(int i=0; i<7; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal:20,
                vertical:10,
              ),
              child: HorizontalChartBar(
                label: i.toString(),
                value: (i+10.27*(1.26+i/10.0))*3,
              ),
            ),
        ],
      ),
    );
  }
}