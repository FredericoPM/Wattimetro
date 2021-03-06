import 'package:flutter/material.dart';
class SearchInput extends StatefulWidget {
  TextEditingController controller;
  void Function(String text) onChange;
  SearchInput({this.controller, this.onChange});
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
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
            controller: widget.controller,
            onChanged: (text) => widget.onChange(text),
            style: TextStyle(color: Color(0xFFFCF8EF)),
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
                icon: Icon(Icons.clear, color: Color(0xFFFCF8EF),),
                onPressed: () {
                  setState(() { widget.controller.text = ""; });
                },
              ) : null,
              filled: true,
              fillColor: Color(0xFF585471),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFF585471),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
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