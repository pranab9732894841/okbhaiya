// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  Places({
    required this.features,
  });
  List<Feature> features;
  factory Places.fromJson(Map<String, dynamic> json) => Places(
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
      };
}

class Feature {
  Feature({
    required this.id,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
  });

  String id;
  String text;
  String placeName;
  List<double> center;
  Geometry geometry;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json['id'],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
