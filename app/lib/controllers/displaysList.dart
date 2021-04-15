import 'package:app/models/display.dart';

class DisplayList{
  List<Display> _displays = [];
  List<Display> get displays => _displays;
  void add(Display display){
    _displays.add(display);
  }
}