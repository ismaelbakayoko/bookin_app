class ModelHotel {
  int? lieu_id;
  String? nom_hotel;
  double? longitude;
  double? latitude;
  String? email;
  String? tel_responsable;
  String? image_hotel;
  String? bref_description;
  String? description_complete;
  String? created_at;
  String? updated_at;

  ModelHotel({
    this.lieu_id,
    this.nom_hotel,
    this.longitude,
    this.latitude,
    this.email,
    this.tel_responsable,
    this.image_hotel,
    this.bref_description,
    this.description_complete,
    this.created_at,
    this.updated_at,
  });

  factory ModelHotel.fromJson(Map<String, dynamic> json) {
    return ModelHotel(
      lieu_id: json['lieu_id'],
      nom_hotel: json['nom_hotel'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      email: json['email'],
      tel_responsable: json['tel_responsable'],
      image_hotel: json['image_hotel'],
      bref_description: json['bref_description'],
      description_complete: json['description_complete'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lieu_id': lieu_id,
      'nom_hotel': nom_hotel,
      'longitude': longitude,
      'latitude': latitude,
      'email': email,
      'tel_responsable': tel_responsable,
      'image_hotel': image_hotel,
      'bref_description': bref_description,
      'description_complete': description_complete,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
