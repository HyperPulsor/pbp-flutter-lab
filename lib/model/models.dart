// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

List<ToDo> toDoFromJson(String str) => List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

String toDoToJson(List<ToDo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDo {
  ToDo({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  DateTime releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: json["watched"],
    title: json["title"],
    rating: json["rating"],
    releaseDate: DateTime.parse(json["release_date"]),
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "review": review,
  };
}

enum Model { MYWATCHLIST_FILMWATCH }

final modelValues = EnumValues({
  "mywatchlist.filmwatch": Model.MYWATCHLIST_FILMWATCH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
