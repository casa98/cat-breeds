import 'dart:convert';

class CatBreedModel {
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? description;
  String? lifeSpan;
  String? altNames;
  int? adaptability;
  int? energyLevel;
  int? intelligence;
  String? wikipediaUrl;
  String? referenceImageId;

  CatBreedModel({
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.altNames,
    this.adaptability,
    this.energyLevel,
    this.intelligence,
    this.wikipediaUrl,
    this.referenceImageId,
  });

  String get catPhotoUrl =>
      'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';

  String get intelligenceAsString => switch (intelligence) {
        1 => 'Basic',
        2 => 'Average',
        3 => 'Decent',
        4 => 'Clever',
        5 => 'Genius',
        _ => 'Unknown',
      };

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    return CatBreedModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      lifeSpan: json['life_span'],
      altNames: json['alt_names'],
      adaptability: json['adaptability'],
      energyLevel: json['energy_level'],
      intelligence: json['intelligence'],
      wikipediaUrl: json['wikipedia_url'],
      referenceImageId: json['reference_image_id'],
    );
  }
}

List<CatBreedModel> listCatBreedsFromJson(String str) =>
    List<CatBreedModel>.from(
      json.decode(str).map((x) => CatBreedModel.fromJson(x)),
    );
