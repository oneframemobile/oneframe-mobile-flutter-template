import 'package:networking/networking/serializable_list.dart';

class CityCounty {
  int id;
  String name;
  double lat;
  double lng;
  bool isSelect = false;
  CityCounty();

  CityCounty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['latitude'];
    lng = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.lat;
    data['longitude'] = this.lng;
    return data;
  }
}

class CityCountyListResponse implements SerializableList<CityCounty> {
  @override
  List<CityCounty> list;

  @override
  List<CityCounty> fromJsonList(List json) {
    return json.map((fields) => CityCounty.fromJson(fields)).toList();
  }

  @override
  List<Map<String, dynamic>> toJsonList() {
    throw new UnsupportedError("Not needed");
  }
}

