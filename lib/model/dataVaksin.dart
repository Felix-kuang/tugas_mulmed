import 'dart:convert';
import 'package:http/http.dart' as http;

class DataVaksin {
  DataVaksin({
    this.indo,
    this.global,
  });

  int global;
  List<Indo> indo;

  factory DataVaksin.fromJson(Map<String, dynamic> json, json2) => DataVaksin(
      indo: List<Indo>.from(json["timeline"].map((x) => Indo.fromJson(x))),
      global: json2[0]['total']);
}

class Indo {
  Indo({
    this.total,
    this.daily,
    this.totalPerHundred,
    this.dailyPerMillion,
    this.date,
  });

  int total;
  int daily;
  int totalPerHundred;
  int dailyPerMillion;
  String date;

  factory Indo.fromJson(Map<String, dynamic> json) => Indo(
        total: json["total"],
        daily: json["daily"],
        totalPerHundred: json["totalPerHundred"],
        dailyPerMillion: json["dailyPerMillion"],
        date: json["date"],
      );
}

Future<DataVaksin> getDataVaksin(String indo, global) async {
  final responseIndo = await http.get(indo);
  final responseglobal = await http.get(global);
  if (responseIndo.statusCode == 200 && responseglobal.statusCode == 200) {
    return DataVaksin.fromJson(
        jsonDecode(responseIndo.body), jsonDecode(responseglobal.body));
  } else {
    throw Exception("Gagal Load data");
  }
}
