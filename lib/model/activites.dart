class ModelActivites {
  int? id_lieu;
  String? nom_activite;
  double? longitude;
  double? latitude;
  String? email;
  String? tel_responsable;
  String? image_activite;
  String? bref_description;
  String? description_complete;
  String? created_at;
  String? updated_at;

  ModelActivites({
    this.id_lieu,
    this.nom_activite,
    this.longitude,
    this.latitude,
    this.email,
    this.tel_responsable,
    this.image_activite,
    this.bref_description,
    this.description_complete,
    this.created_at,
    this.updated_at,
  });

  factory ModelActivites.fromJson(Map<String, dynamic> json) => ModelActivites(
        id_lieu: json["id_lieu"],
        nom_activite: json["nom_activite"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        email: json["email"],
        tel_responsable: json["tel_responsable"],
        image_activite: json["image_activite"],
        bref_description: json["bref_description"],
        description_complete: json["description_complete"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id_lieu": id_lieu,
      "nom_activite": nom_activite,
      "longitude": longitude,
      "latitude": latitude,
      "email": email,
      "tel_responsable": tel_responsable,
      "image_activite": image_activite,
      "bref_description": bref_description,
      "description_complete": description_complete,
      "created_at": created_at,
      "updated_at": updated_at,
    };
  }
}
