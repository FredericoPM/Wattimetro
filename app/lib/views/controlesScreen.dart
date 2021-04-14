import 'package:app/views/sideMenu.dart';
import 'package:app/views/widgets/cardOnOff.dart';
import 'package:app/views/widgets/cardRGB.dart';
import 'package:app/views/widgets/cardSlider.dart';
import 'package:app/views/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'controleForm.dart';

class ControleScreen extends StatefulWidget {
  @override
  _ControleScreenState createState() => _ControleScreenState();
}

class _ControleScreenState extends State<ControleScreen> {
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
            "Controles",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28
            ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ControleForm()));
            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: available ? ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SearchInput(),
              SizedBox(height: 20),
              CardRGB(),
              SizedBox(height: 20),
              CardOnOff(),
              SizedBox(height: 20),
              CardSlider(),
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
                    "assets/images/controllers_empty_image.svg",
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Parece que você não tem nenhum controle",
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