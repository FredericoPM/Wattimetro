import 'package:app/models/controle.dart';
import 'package:app/models/display.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../controleForm.dart';
import '../displayForm.dart';

class CardTemplate extends StatefulWidget {
  var childWidget;
  Display display;
  void Function(Display display) displayDelete;
  Controle controle;
  void Function(Controle controle) controleDelete;
  CardTemplate({
    this.childWidget,
    this.controle,
    this.display,
    this.controleDelete,
    this.displayDelete
  });
  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 16, 6, 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.create, color: Theme.of(context).accentColor, size: 28,),
                  onPressed: (){
                    if(widget.displayDelete != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayForm(
                        delete: widget.displayDelete,
                      )));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ControleForm(
                        delete: widget.controleDelete,
                      )));
                    }
                  }
                ),
                Container(
                  alignment: Alignment.center,
                  width: 230,
                  child: AutoSizeText(
                    widget.controle == null ? widget.display.name : widget.controle.name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.controle == null 
                      ? widget.display.favorite ? Icons.favorite : Icons.favorite_outline 
                      : widget.controle.favorite ? Icons.favorite : Icons.favorite_outline,
                    color: Theme.of(context).accentColor,
                    size: 28
                  ), 
                  onPressed: (){
                    setState(() {
                      if(widget.controle != null)
                        widget.controle.favorite = !widget.controle.favorite;
                      else
                        widget.display.favorite = !widget.display.favorite;
                    });
                  }
                )
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:9, vertical:0),
              child: widget.childWidget == null ? Container()
              : widget.childWidget,
            ), 
          ],
        ),
      ),
    );
  }
}