import 'package:flutter/material.dart';
class DataImput extends StatefulWidget {
  String labelText;
  DataImput({this.labelText});

  @override
  _DataImputState createState() => _DataImputState();
}

class _DataImputState extends State<DataImput> {
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
            style: TextStyle(color: Color(0xFFFCF8EF)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical:18, horizontal: 16),
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: Color(0xFFFCF8EF),
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
              ),
              suffixIcon: _focus ? IconButton(
                icon: Icon(Icons.clear, color: Color(0xFFFCF8EF),),
                onPressed: () {
                  // setState(() { widget.controller.text = ""; });
                  // if(widget.onChanged != null)
                  //   widget.onChanged(widget.controller.text);
                },
              ) : null,
              filled: true,
              fillColor: Color(0xFF585471),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFF585471),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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