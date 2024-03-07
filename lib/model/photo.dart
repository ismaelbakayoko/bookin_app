class ModelPhoto {
  int? lieu_id;
  String? url_photo;
  String? description;
  String? created_at;
  String? updated_at;

  ModelPhoto({
    this.lieu_id,
    this.url_photo,
    this.description,
    this.created_at,
    this.updated_at,
  });

  factory ModelPhoto.fromJson(Map<String, dynamic> json) {
    return ModelPhoto(
      lieu_id: json['lieu_id'],
      url_photo: json['url_photo'],
      description: json['description'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lieu_id': lieu_id,
      'url_photo': url_photo,
      'description': description,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
