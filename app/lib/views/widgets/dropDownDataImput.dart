import 'package:flutter/material.dart';
class DropDownDataImput extends StatefulWidget {
  String labelText;
  String errorText;
  TextEditingController controller;
  List<String> options;
  DropDownDataImput({this.labelText, this.options, this.errorText, this.controller});
  @override
  _DropDownDataImputState createState() => _DropDownDataImputState();
}

class _DropDownDataImputState extends State<DropDownDataImput> {
  String _formvalue;
  bool _focus = false;
  @override
  void initState() { 
    super.initState();
    if(widget.controller.text != ""){
      _formvalue = widget.controller.text;
    }
  }
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
        validator:widget.errorText != null ? (value) => value == null ? widget.errorText : null : null,
        items: [
          for(var option in widget.options)
            DropdownMenuItem(
              value: option,
              child: Text(option),
            ),
        ],
        onChanged: (newValue) {
          setState(() =>  _formvalue = newValue);
          widget.controller.text = newValue;
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