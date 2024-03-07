class ModelLieux {
  int? id;
  String? nom;
  String? ville;
  String? description;
  String? longitude;
  String? latitude;
  String? temperature;
  String? photo_url;

  ModelLieux({
    this.id,
    this.nom,
    this.ville,
    this.description,
    this.longitude,
    this.latitude,
    this.temperature,
    this.photo_url,
  });

  factory ModelLieux.fromJson(Map<String, dynamic> json) {
    return ModelLieux(
      id: json['id'],
      nom: json['nom'],
      ville: json['ville'],
      description: json['description'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      temperature: json['temperature'],
      photo_url: json['photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'ville': ville,
      'description': description,
      'longitude': longitude,
      'latitude': latitude,
      'temperature': temperature,
      'photo_url': photo_url,
    };
  }
}
