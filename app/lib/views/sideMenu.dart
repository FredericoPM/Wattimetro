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
          ],
        ),
      ),
    );
  }
}