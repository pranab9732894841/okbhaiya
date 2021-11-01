import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:okbhaiya/models/picture.dart';

class BusinessUser {
  String id;
  Geo geo;
  String user;
  String businessName;
  String type;
  List<int> category;
  String bio;
  List<String> linkDevice;
  bool verified;
  String phoneNumber;
  String address;
  Pic logoLink;
  List<Pic> coverlink;
  BusinessUser({
    required this.id,
    required this.geo,
    required this.user,
    required this.businessName,
    required this.type,
    required this.category,
    this.bio = '',
    this.linkDevice = const [],
    this.verified = false,
    required this.phoneNumber,
    this.address = '',
    required this.logoLink,
    required this.coverlink,
  });

  BusinessUser copyWith({
    String? id,
    Geo? geo,
    String? user,
    String? businessName,
    String? type,
    List<int>? category,
    String? bio,
    List<String>? linkDevice,
    bool? verified,
    String? phoneNumber,
    String? address,
    Pic? logoLink,
    List<Pic>? coverlink,
  }) {
    return BusinessUser(
      id: id ?? this.id,
      geo: geo ?? this.geo,
      user: user ?? this.user,
      businessName: businessName ?? this.businessName,
      type: type ?? this.type,
      category: category ?? this.category,
      bio: bio ?? this.bio,
      linkDevice: linkDevice ?? this.linkDevice,
      verified: verified ?? this.verified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      logoLink: logoLink ?? this.logoLink,
      coverlink: coverlink ?? this.coverlink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'geo': geo.toMap(),
      'user': user,
      'businessName': businessName,
      'type': type,
      'category': category,
      'bio': bio,
      'linkDevice': linkDevice,
      'verified': verified,
      'phoneNumber': phoneNumber,
      'address': address,
      'logoLink': logoLink.toMap(),
      'coverlink': coverlink.map((x) => x.toMap()).toList(),
    };
  }

  factory BusinessUser.fromMap(Map<String, dynamic> map) {
    return BusinessUser(
      id: map['id'],
      geo: Geo.fromMap(map['geo']),
      user: map['user'],
      businessName: map['businessName'],
      type: map['type'],
      category: List<int>.from(map['category']),
      bio: map['bio'],
      linkDevice: List<String>.from(map['linkDevice']),
      verified: map['verified'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      logoLink: Pic.fromMap(map['logoLink']),
      coverlink: List<Pic>.from(map['coverlink']?.map((x) => Pic.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessUser.fromJson(String source) =>
      BusinessUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusinessUser(id: $id, geo: $geo, user: $user, businessName: $businessName, type: $type, category: $category, bio: $bio, linkDevice: $linkDevice, verified: $verified, phoneNumber: $phoneNumber, address: $address, logoLink: $logoLink, coverlink: $coverlink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BusinessUser &&
        other.id == id &&
        other.geo == geo &&
        other.user == user &&
        other.businessName == businessName &&
        other.type == type &&
        listEquals(other.category, category) &&
        other.bio == bio &&
        listEquals(other.linkDevice, linkDevice) &&
        other.verified == verified &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.logoLink == logoLink &&
        listEquals(other.coverlink, coverlink);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        geo.hashCode ^
        user.hashCode ^
        businessName.hashCode ^
        type.hashCode ^
        category.hashCode ^
        bio.hashCode ^
        linkDevice.hashCode ^
        verified.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        logoLink.hashCode ^
        coverlink.hashCode;
  }
}

class Geo {
  double lat;
  double lng;
  Geo({
    required this.lat,
    required this.lng,
  });

  Geo copyWith({
    double? lat,
    double? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source));

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geo && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
