import 'package:app/models/controle.dart';

class ControleList{
  List<Controle> _controles = [];
  List<Controle> get controles => _controles;
  void add(Controle controle){
    _controles.add(controle);
  }
  void delete(Controle controle){
    print("delete");
  }
  void update(Controle controle){
    print("update");
  }
}