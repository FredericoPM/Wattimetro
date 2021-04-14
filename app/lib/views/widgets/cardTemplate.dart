import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardTemplate extends StatefulWidget {
  var childWidget;
  CardTemplate({this.childWidget});
  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
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
                Container(
                  alignment: Alignment.center,
                  width: 230,
                  child: AutoSizeText(
                    "Teste",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 21,
                    ),
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
              child: widget.childWidget == null ? Container()
              : widget.childWidget,
            ), 
          ],
        ),
      ),
    );
  }
}