/*
json usado pra gerar a classe
{
    "id": 1,
    "name": "nome",
    "type": "type",
    "favorite": true,
    "broker": "broker",
    "topic": "topic",
    "measurement": "measurement",
    "numericalValue": 1.5,
    "numericalValueList": [
        1.5,
        2.1
    ]
}
 */

class Display {
  int _id;
  String _name;
  String _type;
  bool _favorite;
  String _broker;
  String _topic;
  String _measurement;
  double _numericalValue;
  List<double> _numericalValueList;

  Display({
    int id,
    String name,
    String type,
    bool favorite,
    String broker,
    String topic,
    String measurement,
    double numericalValue,
    List<double> numericalValueList
  }) {
    this._id = id;
    this._name = name;
    this._type = type;
    this._favorite = favorite == null ? false : favorite;
    this._broker = broker;
    this._topic = topic;
    this._measurement = measurement;
    this._numericalValue = numericalValue == null ? 0.0 : numericalValue;
    this._numericalValueList = numericalValueList == null ? [] : numericalValueList;
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
  String get measurement => _measurement;
  set measurement(String measurement) => _measurement = measurement;
  double get numericalValue => _numericalValue;
  set numericalValue(double numericalValue) => _numericalValue = numericalValue;
  List<double> get numericalValueList => _numericalValueList;
  set numericalValueList(List<double> numericalValueList) =>
      _numericalValueList = numericalValueList;

  Display.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _favorite = json['favorite'] == 1;
    _broker = json['broker'];
    _topic = json['topic'];
    _measurement = json['measurement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['type'] = this._type;
    data['favorite'] = this._favorite ? 1 : 0;
    data['broker'] = this._broker;
    data['topic'] = this._topic;
    data['measurement'] = this._measurement;
    return data;
  }
}
