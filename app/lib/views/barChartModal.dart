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
      height: 480,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xFF585471),
                  ),
                  child: Center(
                    child: Text(
                      "1H",
                      style: TextStyle(
                        fontSize: 21,
                        // color:,
                      ),
                    )
                  ),
                ),
                Container(
                  height: 30,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xFF585471),
                  ),
                  child: Center(
                    child: Text(
                      "1D",
                      style: TextStyle(
                        fontSize: 21,
                        // color:,
                      ),
                    )
                  ),
                ),
                Container(
                  height: 30,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Center(
                    child: Text(
                      "7D",
                      style: TextStyle(
                        fontSize: 21,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
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