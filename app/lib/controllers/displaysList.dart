import 'package:app/models/display.dart';
import 'package:app/models/repositorie/displaySQLite.dart';

class DisplayList{
  DisplaySQLite dataBase = DisplaySQLite();
  List<Display> _displays = [];
  List<Display> get displays => _displays;
  Future<void> getAll() async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    _displays = await dataBase.getAll();
  }
  void add(Display display) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.insert(display);
  }
  void delete(Display display) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.delete(display.id);
    await getAll();
  }
  //! edit não ocorre
  void update(Display display) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.update(display);
    await getAll();
  }
  List<Display> searchByName(String name){
    return _displays.where((display) => display.name == name).toList();
  }
}