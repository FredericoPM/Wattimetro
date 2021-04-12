import 'package:app/views/sideMenu.dart';
import 'package:app/views/widgets/cardTemplate.dart';
import 'package:app/views/widgets/searchInput.dart';
import 'package:flutter/material.dart';

class ControllersScreen extends StatefulWidget {
  @override
  _ControllersScreenState createState() => _ControllersScreenState();
}

class _ControllersScreenState extends State<ControllersScreen> {
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
            "Controllers", 
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
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SearchInput(),
              SizedBox(height: 20),
              CardTemplate(
                type: "rgb",
              ),
              SizedBox(height: 20),
              CardTemplate(
                type: "on/off",
              ),
              SizedBox(height: 20),
              CardTemplate(
                type: "slider",
              ),
            ],
          ),
        ),
      ),
    );
  }
}