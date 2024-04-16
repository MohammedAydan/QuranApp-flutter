import "dart:convert";

import "package:flutter/services.dart" show rootBundle;
import "package:quran/models/sura.dart";

Future<List<Sura>> getSuwarForJsonFile(String localeCode) async {
  String data = await rootBundle.loadString("assets/suwar.json");
  List suwarJson = jsonDecode(data)["suwar"][localeCode];
  List<Sura> suwar = suwarJson.map((s) => Sura.fromJson(s)).toList();
  return suwar;
}
