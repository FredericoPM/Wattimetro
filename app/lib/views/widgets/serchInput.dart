import 'package:flutter/material.dart';
class SerachInput extends StatefulWidget {
  SerachInput({Key key}) : super(key: key);

  @override
  _SerachInputState createState() => _SerachInputState();
}

class _SerachInputState extends State<SerachInput> {
  bool _focus = false;
  @override
  Widget build(BuildContext context) {
    return FocusScope(
        child: Focus(
          onFocusChange: (focus)  {
            setState(() { _focus = focus; });
            // if(!focus && widget.onFocusExit != null){
              // widget.onFocusExit();
            // }
          },
          child:TextFormField(
            onChanged: (text) => {
              // if(widget.onChanged != null)
              //   widget.onChanged(text)
            },
            decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16,8,16,8),
                  hintText: "Pesquisar",
                  hintStyle: TextStyle(
                    color: Color(0xFFFCF8EF),
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  errorStyle: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                  prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                  suffixIcon: _focus ? IconButton(
                    icon: Icon(Icons.clear, color: Theme.of(context).canvasColor,),
                    onPressed: () {
                      // setState(() { widget.controller.text = ""; });
                      // if(widget.onChanged != null)
                      //   widget.onChanged(widget.controller.text);
                    },
                  ) : null,
                  filled: true,
                  fillColor: Color(0xFF585471),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFF585471),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              )
          ),  
        );
  }
}