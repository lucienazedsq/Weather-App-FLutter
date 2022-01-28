import 'package:flutter/material.dart';

class Meteo {
  var NomVille;
  var description;
  var iCon;
  var temperature;
  var temperature_min;
  var temperature_max;
  var pression;
  var vent;
  var humidite;

  Meteo(
      {this.NomVille,
      this.temperature,
      this.temperature_min,
      this.temperature_max,
      this.pression,
      this.vent,
      this.humidite,
      this.description,
      this.iCon});

  Meteo.fromJson(Map<String, dynamic> json) {
    NomVille = json["name"];
    temperature = json["main"]["temp"];
    temperature_min = json["main"]["temp_min"];
    temperature_max = json["main"]["temp_max"];
    pression = json["main"]["pressure"];
    vent = json["wind"]["speed"];
    humidite = json["main"]["humidity"];
    description = json['weather'][0]['description'];
    iCon = json["weather"][0]["icon"];
  }
}
