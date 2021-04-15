import 'package:flutter/material.dart';
class DropDownDataImput extends StatefulWidget {
  String labelText;
  List<String> options;
  DropDownDataImput({this.labelText, this.options});
  @override
  _DropDownDataImputState createState() => _DropDownDataImputState();
}

class _DropDownDataImputState extends State<DropDownDataImput> {
  String _formvalue;
  bool _focus = false;
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focus)  {
        setState(() { _focus = focus; });
        // if(!focus && widget.onFocusExit != null){
          // widget.onFocusExit();
        // }
      },
      child: DropdownButtonFormField(
        isExpanded: true,
        iconEnabledColor: Color(0xFFFCF8EF),
        dropdownColor: Color(0xFF615C7D),
        validator: (value) => value == null ? 'Selecione o tipo!' : null,
        items: [
          for(var option in widget.options)
            DropdownMenuItem(
              value: option,
              child: Text(option),
            ),
        ],
        onChanged: (newValue) {
          setState(() =>  _formvalue = newValue);
        },
        value: _formvalue,
        style: TextStyle(color: Color(0xFFFCF8EF), fontSize: 16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:13.5, horizontal: 16),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Color(0xFFFCF8EF),
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
          errorStyle: TextStyle(
            color: Theme.of(context).errorColor,
          ),
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
      ),
    );
  }
}