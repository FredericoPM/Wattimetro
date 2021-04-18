import 'package:app/models/controle.dart';
import 'package:app/models/repositorie/controleSQLite.dart';

class ControleList{
  ControleSQLite dataBase = ControleSQLite();
  List<Controle> _controles = [];
  List<Controle> get controles => _controles;
  Future<void> getAll() async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    _controles = await dataBase.getAll();
  }
  void add(Controle controle) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.insert(controle);
    await getAll();
  }
  //! Ainda não implementado
  void delete(Controle controle) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    print("delete");
  }
  //! Ainda não implementado
  void update(Controle controle) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    print("update");
  }
  List<Controle> searchByName(String name){
    return _controles.where((controle) => controle.name.substring(0, name.length) == name).toList();
  }
}