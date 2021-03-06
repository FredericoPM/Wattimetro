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
  bool _favorite = false;
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
    this._favorite = favorite == null ? false : favorite;
    this._broker = broker;
    this._topic = topic;
    this._rgbValue = rgbValue == null ? "0,0,0" : rgbValue;
    this._onState = onState == null ? false : onState;
    this._sliderState = sliderState == null ? 0.0 : sliderState;
  }

  int get id => _id;
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
    _favorite = json['favorite'] == 1;
    _broker = json['broker'];
    _topic = json['topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this._id != null)
      data['id'] = this._id;
    data['name'] = this._name;
    data['type'] = this._type;
    data['favorite'] = this._favorite ? 1 : 0;
    data['broker'] = this._broker;
    data['topic'] = this._topic;
    return data;
  }
}
