import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14, 16, 14, 28),
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
                  "Teste",
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
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.lightbulb_outline,
                size: 35.0,
                color: Theme.of(context).cardColor,
              ),
              padding: EdgeInsets.all(30),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}