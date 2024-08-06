class LocationsModel {
  final String? title;
  final String? description;
  final String? image;
  final String? region;
  final String? location;

  LocationsModel({
    this.description,
    this.title,
    this.image,
    this.location,
    this.region,
  });

  factory LocationsModel.fromJson(Map<String, dynamic> json) {
    return LocationsModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      region: json['region'],
      location: json['location'],
    );
  }
}
