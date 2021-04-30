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
  TextEditingController _searchController = TextEditingController();
  //TODO: transformar o controleList em um provider
  ControleList controleList = ControleList();
  List<Controle> controles = [];
  selectCard(Controle controle){
    switch(controle.type){
      case "RGB":
        return Column(
          children: [
            CardRGB(
              controle: controle,
              delete:(controle) {
                controleList.delete(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
              update:(controle) {
                controleList.update(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
            ),
            SizedBox(height: 20),
          ],
        );
      break;
      case "On/Off":
        return Column(
          children: [
            CardOnOff(
              controle: controle,
              delete:(controle) {
                controleList.delete(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
              update:(controle) {
                controleList.update(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
            ),
            SizedBox(height: 20),
          ],
        );
      break;
      case "Slider":
        return Column(
          children: [
            CardSlider(
              controle: controle,
              delete:(controle) {
                controleList.delete(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
              update:(controle) {
                controleList.update(controle);
                controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
              },
            ),
            SizedBox(height: 20),
          ],
        );
      break;
    }
  }
  
  @override
  void initState() { 
    super.initState();
    controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
  }
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ControleForm(
                add: (controle){
                  controleList.add(controle);
                  controleList.getAll().then((_) => setState(() {controles = controleList.controles;}));
                },
              )));
            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 28),
          child: Column(
            children: [
              SearchInput(
                controller: _searchController,
                onChange: (text) =>{
                  setState(() {
                    controles = controleList.searchByName(text);
                    print(controles);
                  })
                },
              ),
              SizedBox(height: 20),
              controles.length > 0
              ? Container(
                height: MediaQuery.of(context).size.height - 204,
                child: ListView.builder(
                  itemCount: controles.length,
                  itemBuilder: (ctx, index){
                    return selectCard(controles[index]);
                  }
                ),
              )
              : Container(
                height: MediaQuery.of(context).size.height - 204,
                child: Center(
                  child: Opacity(
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
                          "Nenhum controle encontrado",
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
            ],
          )
        ),
      ),
    );
  }
}