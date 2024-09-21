class MapAddressModel {
  List<Results>? results;

  MapAddressModel({
    this.results,
  });

  MapAddressModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  Results({
    this.formattedAddress,
    this.geometry,
    this.placeId,
  });

  Results.fromJson(dynamic json) {
    formattedAddress = json['formatted_address'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    placeId = json['place_id'];
  }

  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
}

class Geometry {
  Geometry({
    this.location,
  });

  Geometry.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Location? location;
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
