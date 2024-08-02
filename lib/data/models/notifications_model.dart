// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NotificationsModel welcomeFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String welcomeToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  String? title;
  String? description;
  int? iconType;
  Timestamp? dateTime;

  NotificationsModel({
    this.title,
    this.description,
    this.iconType,
    this.dateTime,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    title: json["title"],
    description: json["desctription"],
    iconType: json["icon_type"],
    dateTime: json["date_time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "desctription": description,
    "icon_type": iconType,
    "date_time": dateTime,
  };
}
