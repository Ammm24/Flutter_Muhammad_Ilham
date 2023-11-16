// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  final dynamic userId;
  final dynamic id;
  final dynamic title;
  final dynamic body;

  Contact({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
