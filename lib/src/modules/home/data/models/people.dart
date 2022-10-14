import 'dart:convert';

People peopleModelFromJson(String str) => People.fromJson(json.decode(str));

String peopleModelToJson(People data) => json.encode(data.toJson());

class People {
  String? birthYear;
  String? eyeColor;
  List<String>? films;
  String? gender;
  String? hairColor;
  String? height;
  String? homeworld;
  String? mass;
  String? name;
  String? skinColor;
  String? created;
  String? edited;
  List<String>? species;
  List<String>? starships;
  String? url;
  List<String>? vehicles;

  People(
      {this.birthYear,
      this.eyeColor,
      this.films,
      this.gender,
      this.hairColor,
      this.height,
      this.homeworld,
      this.mass,
      this.name,
      this.skinColor,
      this.created,
      this.edited,
      this.species,
      this.starships,
      this.url,
      this.vehicles});

  People.fromJson(Map<String, dynamic> json) {
    birthYear = json['birth_year'];
    eyeColor = json['eye_color'];
    films = json['films'].cast<String>();
    gender = json['gender'];
    hairColor = json['hair_color'];
    height = json['height'];
    homeworld = json['homeworld'];
    mass = json['mass'];
    name = json['name'];
    skinColor = json['skin_color'];
    created = json['created'];
    edited = json['edited'];
    species = json['species'].cast<String>();
    starships = json['starships'].cast<String>();
    url = json['url'];
    vehicles = json['vehicles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birth_year'] = this.birthYear ?? '';
    data['eye_color'] = this.eyeColor ?? '';
    data['films'] = this.films ?? [];
    data['gender'] = this.gender ?? '';
    data['hair_color'] = this.hairColor ?? '';
    data['height'] = this.height ?? '';
    data['homeworld'] = this.homeworld ?? '';
    data['mass'] = this.mass ?? '';
    data['name'] = this.name ?? '';
    data['skin_color'] = this.skinColor ?? '';
    data['created'] = this.created ?? '';
    data['edited'] = this.edited ?? '';
    data['species'] = this.species ?? [];
    data['starships'] = this.starships ?? [];
    data['url'] = this.url ?? '';
    data['vehicles'] = this.vehicles ?? [];
    return data;
  }
}
