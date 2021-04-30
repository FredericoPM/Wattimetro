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
  void delete(Controle controle) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.delete(controle.id);
    await getAll();
  }
  //! edit não ocorre
  void update(Controle controle) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.update(controle);
    await getAll();
  }
  List<Controle> searchByName(String text){
    return _controles.where((item) => item.name.substring(0, text.length) == text).toList();
  }
}