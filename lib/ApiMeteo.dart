import 'dart:convert';

import 'package:appli_meteo/AfficheurMeteo.dart';
import 'package:http/http.dart' as http;

class APImeteo {
  Future<Meteo>? getMeteoActuelle(String? Ville) async {
    var Lien = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$Ville&appid=b04adff927fe6f94ea2f5418b1d616d3&lang=fr&units=metric");

    var response = await http.get(Lien);
    var body = jsonDecode(response.body);

    Meteo meteo = Meteo.fromJson(body);
    
    return meteo;
  }
}
