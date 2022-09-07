import 'dart:convert';

class City {
  int? id;
  String? name;
  int? countryId;

  City({this.id, this.name, this.countryId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    return data;
  }
}