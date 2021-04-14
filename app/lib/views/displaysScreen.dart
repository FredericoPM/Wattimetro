import 'package:app/views/sideMenu.dart';
import 'package:app/views/widgets/cardDigitalDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'displayForm.dart';
import 'widgets/cardTemplate.dart';
import 'widgets/cardBarChart.dart';
import 'widgets/searchInput.dart';

class DisplaysScreen extends StatefulWidget {
  DisplaysScreen({Key key}) : super(key: key);

  @override
  _DisplaysScreenState createState() => _DisplaysScreenState();
}

class _DisplaysScreenState extends State<DisplaysScreen> {
  bool available = true;
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
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayForm())),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: available ? Column(
            children: [
              SearchInput(),
              SizedBox(height: 20),
              CardBarChart(),
              SizedBox(height: 20),
              CardDigitalDisplay(),
            ],
          )
          : Opacity(
              opacity: 0.9,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  height: (MediaQuery.of(context).size.height-AppBar().preferredSize.height-56) * 0.4,
                  child: SvgPicture.asset(
                    "assets/images/displays_empty_image.svg",
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Parece que você não tem nenhum display",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}