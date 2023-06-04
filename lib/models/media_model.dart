import 'dart:convert';

MediaModel mediamodelFromJson(String str) =>
    MediaModel.fromJson(json.decode(str));
class MediaModel {
  List<Data>? data;

  MediaModel({this.data});

  MediaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? subtitle;
  String? url;
  String? thumbnailUrl;
  int? mediaType;
  bool? doFollow;
  bool? keyHighlight;
  int? id;
  int? createdAtTimestamp;
  String? sourceUrl;

  Data(
      {this.title,
        this.subtitle,
        this.url,
        this.thumbnailUrl,
        this.mediaType,
        this.doFollow,
        this.keyHighlight,
        this.id,
        this.createdAtTimestamp,
        this.sourceUrl});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
    mediaType = json['mediaType'];
    doFollow = json['doFollow'];
    keyHighlight = json['keyHighlight'];
    id = json['id'];
    createdAtTimestamp = json['createdAtTimestamp'];
    sourceUrl = json['sourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['mediaType'] = this.mediaType;
    data['doFollow'] = this.doFollow;
    data['keyHighlight'] = this.keyHighlight;
    data['id'] = this.id;
    data['createdAtTimestamp'] = this.createdAtTimestamp;
    data['sourceUrl'] = this.sourceUrl;
    return data;
  }
}