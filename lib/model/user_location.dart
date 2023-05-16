// import 'package:flutter/foundation.dart';

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }
}

class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimeZone timezone;
  UserLocation({
    required this.city,
    required this.coordinates,
    required this.country,
    required this.postcode,
    required this.state,
    required this.street,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = LocationStreet.fromMap(json['street']);
    final timezone = LocationTimeZone.fromMap(json['timezone']);
    final coordinates = LocationCoordinate.fromMap(json['coordinates']);

    return UserLocation(
        city: json['city'],
        coordinates: coordinates,
        country: json['country'],
        postcode: json['postcode'].toString(),
        state: json['state'],
        street: street,
        timezone: timezone);
  }

  String get fullStreetName {
    return '${street.number}${street.name}';
  }

  String get fullcoordinates {
    return '${coordinates.latitude}${coordinates.longitude}';
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class LocationTimeZone {
  final String offset;
  final String description;
  LocationTimeZone({
    required this.offset,
    required this.description,
  });
  factory LocationTimeZone.fromMap(Map<String, dynamic> json) {
    return LocationTimeZone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}
