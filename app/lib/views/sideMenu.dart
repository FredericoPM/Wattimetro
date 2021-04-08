import 'package:flutter/material.dart';
import 'controllersScreen.dart';
import 'displaysScreen.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:[
                Container(
                  height: 88,
                  width: 1000,
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
              ]
            ),
            Container(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      children: [
                        Text("©", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
                        Text(" FredericoPM", style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Text("fredericopradomarques@gmail.com", style: TextStyle(fontWeight: FontWeight.w300)),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}