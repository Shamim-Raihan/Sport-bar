import 'dart:convert';

MediaCatModel mediacatFromJson(String str) =>
    MediaCatModel.fromJson(json.decode(str));
class MediaCatModel {
  Data? data;

  MediaCatModel({this.data});

  MediaCatModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<UniqueTournaments>? uniqueTournaments;
  List<int>? topUniqueTournamentIds;

  Data({this.uniqueTournaments, this.topUniqueTournamentIds});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['uniqueTournaments'] != null) {
      uniqueTournaments = <UniqueTournaments>[];
      json['uniqueTournaments'].forEach((v) {
        uniqueTournaments!.add(new UniqueTournaments.fromJson(v));
      });
    }
    topUniqueTournamentIds = json['topUniqueTournamentIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uniqueTournaments != null) {
      data['uniqueTournaments'] =
          this.uniqueTournaments!.map((v) => v.toJson()).toList();
    }
    data['topUniqueTournamentIds'] = this.topUniqueTournamentIds;
    return data;
  }
}

class UniqueTournaments {
  String? name;
  String? slug;
  String? primaryColorHex;
  String? secondaryColorHex;
  Category? category;
  int? userCount;
  int? id;
  bool? displayInverseHomeAwayTeams;

  UniqueTournaments(
      {this.name,
        this.slug,
        this.primaryColorHex,
        this.secondaryColorHex,
        this.category,
        this.userCount,
        this.id,
        this.displayInverseHomeAwayTeams});

  UniqueTournaments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    primaryColorHex = json['primaryColorHex'];
    secondaryColorHex = json['secondaryColorHex'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    userCount = json['userCount'];
    id = json['id'];
    displayInverseHomeAwayTeams = json['displayInverseHomeAwayTeams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['primaryColorHex'] = this.primaryColorHex;
    data['secondaryColorHex'] = this.secondaryColorHex;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['userCount'] = this.userCount;
    data['id'] = this.id;
    data['displayInverseHomeAwayTeams'] = this.displayInverseHomeAwayTeams;
    return data;
  }
}

class Category {
  String? name;
  String? slug;
  Sport? sport;
  int? id;
  String? flag;
  String? alpha2;

  Category({this.name, this.slug, this.sport, this.id, this.flag, this.alpha2});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    id = json['id'];
    flag = json['flag'];
    alpha2 = json['alpha2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    data['id'] = this.id;
    data['flag'] = this.flag;
    data['alpha2'] = this.alpha2;
    return data;
  }
}

class Sport {
  String? name;
  String? slug;
  int? id;

  Sport({this.name, this.slug, this.id});

  Sport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['id'] = this.id;
    return data;
  }
}