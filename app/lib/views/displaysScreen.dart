import 'package:app/views/sideMenu.dart';
import 'package:flutter/material.dart';

import 'widgets/cardTemplate.dart';
import 'widgets/barChartCard.dart';
import 'widgets/searchInput.dart';

class DisplaysScreen extends StatefulWidget {
  DisplaysScreen({Key key}) : super(key: key);

  @override
  _DisplaysScreenState createState() => _DisplaysScreenState();
}

class _DisplaysScreenState extends State<DisplaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar:AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
            "Displays", 
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28
            ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30),
            onPressed: (){

            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: Column(
            children: [
              SearchInput(),
              SizedBox(height: 20),
              BarChartCard(),
              SizedBox(height: 20),
              CardTemplate(type: "digitalDisplay"),
            ],
          ),
        ),
      ),
    );
  }
}