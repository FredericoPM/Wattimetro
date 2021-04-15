import 'package:app/controllers/controleList.dart';
import 'package:app/models/controle.dart';
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
  //TODO: transformar o controleList em um provider
  ControleList controleList = ControleList();
  bool available;
  selectCard(Controle controle){
    switch(controle.type){
      case "RGB":
        return Column(
          children: [
            SizedBox(height: 20),
            CardRGB(
              controle: controle,
              delete:(controle) {
                setState(() {
                  controleList.delete(controle);
                });
              },
            ),
          ],
        );
      break;
      case "On/Off":
        return Column(
          children: [
            SizedBox(height: 20),
            CardOnOff(
              controle: controle,
              delete:(controle) {
                setState(() {
                  controleList.delete(controle);
                });
              },
            ),
          ],
        );
      break;
      case "Slider":
        return Column(
          children: [
            SizedBox(height: 20),
            CardSlider(
              controle: controle,
              delete:(controle) {
                setState(() {
                  controleList.delete(controle);
                });
              },
            ),
          ],
        );
      break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    available = controleList.controles.length > 0;
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ControleForm(
                add: (controle){
                  setState(() {
                    controleList.add(controle);
                  });
                },
              )));
            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: available ? ListView(
            children: [
              SearchInput(),
              for(var controle in controleList.controles)
                selectCard(controle),
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