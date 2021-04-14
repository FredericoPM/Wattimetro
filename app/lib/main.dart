import 'package:flutter/material.dart';
import 'views/controlesScreen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF110A33),
        accentColor: Color(0xFFFFD500),
        errorColor: Color(0xFFDB5256),
        canvasColor: Color(0xFF2D2843),
        cardColor: Color(0xFF1E173B),
        fontFamily: "RobotoMono",
         textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Color(0xFFFCF8EF), 
          displayColor: Color(0xFFFCF8EF), 
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ControllersScreen(),
    );
  }
}
