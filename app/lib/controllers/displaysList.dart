import 'package:app/models/display.dart';

class DisplayList{
  List<Display> _displays = [];
  List<Display> get displays => _displays;
  void add(Display display){
    _displays.add(display);
  }
  void delete(Display display){
    print("delete");
  }
  void update(Display display){
    print("update");
  }
  List<Display> searchByName(String name){
    return _displays.where((display) => display.name == name).toList();
  }
}