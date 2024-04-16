import 'dart:convert';

class Sura {
  final int? id;
  final String? name;
  final int? startPage;
  final int? endPage;
  final int? makkia;
  final int? type;

  Sura({
    this.id,
    this.name,
    this.startPage,
    this.endPage,
    this.makkia,
    this.type,
  });

  factory Sura.fromRawJson(String str) => Sura.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sura.fromJson(Map<String, dynamic> json) => Sura(
        id: json["id"],
        name: json["name"],
        startPage: json["start_page"],
        endPage: json["end_page"],
        makkia: json["makkia"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start_page": startPage,
        "end_page": endPage,
        "makkia": makkia,
        "type": type,
      };
}
