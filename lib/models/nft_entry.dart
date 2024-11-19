import 'dart:convert';

List<NftEntry> NftEntryFromJson(String str) =>
    List<NftEntry>.from(json.decode(str).map((x) => NftEntry.fromJson(x)));

String NftEntryToJson(List<NftEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NftEntry {
  String model;
  int pk;
  Fields fields;

  NftEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory NftEntry.fromJson(Map<String, dynamic> json) => NftEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  String description;
  String image;
  String creator;
  String tokenId;
  DateTime createdAt;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.creator,
    required this.tokenId,
    required this.createdAt,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        creator: json["creator"],
        tokenId: json["token_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "creator": creator,
        "token_id": tokenId,
        "created_at": createdAt.toIso8601String(),
      };
}
