import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  int id;
  String name;
  String image;
  String type;
  bool featured;
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.featured,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'type': type,
      'featured': featured,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      type: map['type'],
      featured: map['featured'],
    );
  }
  factory Category.fromSnapshot(DocumentSnapshot map) {
    return Category(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      type: map['type'],
      featured: map['featured'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
