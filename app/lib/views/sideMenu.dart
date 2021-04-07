import 'package:flutter/material.dart';
import 'controllersScreen.dart';
import 'displaysScreen.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 88,
              child : DrawerHeader(
                child: Text('Menu', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ControllersScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb, color: Theme.of(context).accentColor, size: 30),
                      SizedBox(width: 10,),
                      Text('Controllers', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => DisplaysScreen()));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  child: Row(
                    children: [
                      Icon(Icons.assessment, color: Theme.of(context).accentColor, size: 30),
                      SizedBox(width: 10,),
                      Text('Displays', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}