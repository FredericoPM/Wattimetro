import 'package:flutter/material.dart';
class DataImput extends StatefulWidget {
  String labelText;
  String errorText;
  TextEditingController controller;
  DataImput({this.labelText, this.controller, this.errorText});
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
          },
          child:TextFormField(
            controller: widget.controller,
            validator: widget.errorText == "" ? null : (s) {
              if (s.isEmpty)
                return widget.errorText;
              else
                return null;
            },
            style: TextStyle(color: Color(0xFFFCF8EF), fontSize: 16),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                    color: Theme.of(context).errorColor,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).errorColor,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical:15, horizontal: 16),
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: Color(0xFFFCF8EF),
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
              suffixIcon: _focus ? IconButton(
                icon: Icon(Icons.clear, color: Color(0xFFFCF8EF),),
                onPressed: () {
                  setState(() { widget.controller.text = ""; });
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
                  color: Color(0xFFFCF8EF),
                ),
              ),
          ),
        )
      ),  
    );
  }
}