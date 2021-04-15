/*
json usado pra gerar a classe
{
  "id": 1,
  "name": "nome",
  "type": "type",
  "favorite": true,
  "broker": "broker",
  "topic": "topic",
  "rgbValue": "255,255,255",
  "onState": true,
  "sliderState": 1.5
}
*/
class Controle {
  int _id;
  String _name;
  String _type;
  bool _favorite;
  String _broker;
  String _topic;
  String _rgbValue;
  bool _onState;
  double _sliderState;

  Controle({
    int id,
    String name,
    String type,
    bool favorite,
    String broker,
    String topic,
    String rgbValue,
    bool onState,
    double sliderState
  }){
    this._id = id;
    this._name = name;
    this._type = type;
    this._favorite = favorite;
    this._broker = broker;
    this._topic = topic;
    this._rgbValue = rgbValue;
    this._onState = onState;
    this._sliderState = sliderState;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get type => _type;
  set type(String type) => _type = type;
  bool get favorite => _favorite;
  set favorite(bool favorite) => _favorite = favorite;
  String get broker => _broker;
  set broker(String broker) => _broker = broker;
  String get topic => _topic;
  set topic(String topic) => _topic = topic;
  String get rgbValue => _rgbValue;
  set rgbValue(String rgbValue) => _rgbValue = rgbValue;
  bool get onState => _onState;
  set onState(bool onState) => _onState = onState;
  double get sliderState => _sliderState;
  set sliderState(double sliderState) => _sliderState = sliderState;

  Controle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _favorite = json['favorite'];
    _broker = json['broker'];
    _topic = json['topic'];
    _rgbValue = json['rgbValue'];
    _onState = json['onState'];
    _sliderState = json['sliderState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['type'] = this._type;
    data['favorite'] = this._favorite;
    data['broker'] = this._broker;
    data['topic'] = this._topic;
    data['rgbValue'] = this._rgbValue;
    data['onState'] = this._onState;
    data['sliderState'] = this._sliderState;
    return data;
  }
}
