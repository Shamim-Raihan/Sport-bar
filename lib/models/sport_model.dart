import 'dart:convert';

SportResponse sportResponseFromJson(String str) =>
    SportResponse.fromJson(json.decode(str));

String sportResponseToJson(SportResponse data) => json.encode(data.toJson());

class SportResponse {
  List<Datum>? data;

  SportResponse({
    this.data,
  });

  factory SportResponse.fromJson(Map<String, dynamic> json) => SportResponse(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Tournament? tournament;
  String? customId;
  Status? status;
  int? winnerCode;
  Team? homeTeam;
  Team? awayTeam;
  AwayScore? homeScore;
  AwayScore? awayScore;
  Time? time;
  Changes? changes;
  bool? hasGlobalHighlights;
  bool? crowdsourcingDataDisplayEnabled;
  int? id;
  int? startTimestamp;
  String? slug;
  Periods? periods;
  bool? finalResultOnly;

  Datum({
    this.tournament,
    this.customId,
    this.status,
    this.winnerCode,
    this.homeTeam,
    this.awayTeam,
    this.homeScore,
    this.awayScore,
    this.time,
    this.changes,
    this.hasGlobalHighlights,
    this.crowdsourcingDataDisplayEnabled,
    this.id,
    this.startTimestamp,
    this.slug,
    this.periods,
    this.finalResultOnly,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tournament: json["tournament"] == null
            ? null
            : Tournament.fromJson(json["tournament"]),
        customId: json["customId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        winnerCode: json["winnerCode"],
        homeTeam:
            json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
        awayTeam:
            json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
        homeScore: json["homeScore"] == null
            ? null
            : AwayScore.fromJson(json["homeScore"]),
        awayScore: json["awayScore"] == null
            ? null
            : AwayScore.fromJson(json["awayScore"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        changes:
            json["changes"] == null ? null : Changes.fromJson(json["changes"]),
        hasGlobalHighlights: json["hasGlobalHighlights"],
        crowdsourcingDataDisplayEnabled:
            json["crowdsourcingDataDisplayEnabled"],
        id: json["id"],
        startTimestamp: json["startTimestamp"],
        slug: json["slug"],
        periods:
            json["periods"] == null ? null : Periods.fromJson(json["periods"]),
        finalResultOnly: json["finalResultOnly"],
      );

  Map<String, dynamic> toJson() => {
        "tournament": tournament?.toJson(),
        "customId": customId,
        "status": status?.toJson(),
        "winnerCode": winnerCode,
        "homeTeam": homeTeam?.toJson(),
        "awayTeam": awayTeam?.toJson(),
        "homeScore": homeScore?.toJson(),
        "awayScore": awayScore?.toJson(),
        "time": time?.toJson(),
        "changes": changes?.toJson(),
        "hasGlobalHighlights": hasGlobalHighlights,
        "crowdsourcingDataDisplayEnabled": crowdsourcingDataDisplayEnabled,
        "id": id,
        "startTimestamp": startTimestamp,
        "slug": slug,
        "periods": periods?.toJson(),
        "finalResultOnly": finalResultOnly,
      };
}

class Time {
  int? injuryTime2;
  int? currentPeriodStartTimestamp;

  Time({
    this.injuryTime2,
    this.currentPeriodStartTimestamp,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        injuryTime2: json["injuryTime2"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "injuryTime2": injuryTime2,
        "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
      };
}

class AwayScore {
  AwayScore();

  factory AwayScore.fromJson(Map<String, dynamic> json) => AwayScore();

  Map<String, dynamic> toJson() => {};
}

class Team {
  String? name;
  String? slug;
  String? shortName;
  Sport? sport;
  int? userCount;
  String? nameCode;
  int? type;
  int? id;
  Country? country;
  List<dynamic>? subTeams;
  TeamColors? teamColors;

  Team({
    this.name,
    this.slug,
    this.shortName,
    this.sport,
    this.userCount,
    this.nameCode,
    this.type,
    this.id,
    this.country,
    this.subTeams,
    this.teamColors,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        userCount: json["userCount"],
        nameCode: json["nameCode"],
        type: json["type"],
        id: json["id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        subTeams: json["subTeams"] == null
            ? []
            : List<dynamic>.from(json["subTeams"]!.map((x) => x)),
        teamColors: json["teamColors"] == null
            ? null
            : TeamColors.fromJson(json["teamColors"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "sport": sport?.toJson(),
        "userCount": userCount,
        "nameCode": nameCode,
        "type": type,
        "id": id,
        "country": country?.toJson(),
        "subTeams":
            subTeams == null ? [] : List<dynamic>.from(subTeams!.map((x) => x)),
        "teamColors": teamColors?.toJson(),
      };
}

class Country {
  String? alpha2;
  String? name;

  Country({
    this.alpha2,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        alpha2: json["alpha2"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "alpha2": alpha2,
        "name": name,
      };
}

class Sport {
  String? name;
  String? slug;
  int? id;

  Sport({
    this.name,
    this.slug,
    this.id,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        name: json["name"],
        slug: json["slug"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "id": id,
      };
}

class TeamColors {
  String? primary;
  String? secondary;
  String? text;

  TeamColors({
    this.primary,
    this.secondary,
    this.text,
  });

  factory TeamColors.fromJson(Map<String, dynamic> json) => TeamColors(
        primary: json["primary"],
        secondary: json["secondary"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
        "text": text,
      };
}

class Changes {
  int? changeTimestamp;

  Changes({
    this.changeTimestamp,
  });

  factory Changes.fromJson(Map<String, dynamic> json) => Changes(
        changeTimestamp: json["changeTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "changeTimestamp": changeTimestamp,
      };
}

class Periods {
  String? current;
  String? period1;
  String? period2;
  String? period3;
  String? period4;
  String? overtime;

  Periods({
    this.current,
    this.period1,
    this.period2,
    this.period3,
    this.period4,
    this.overtime,
  });

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        current: json["current"],
        period1: json["period1"],
        period2: json["period2"],
        period3: json["period3"],
        period4: json["period4"],
        overtime: json["overtime"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "period1": period1,
        "period2": period2,
        "period3": period3,
        "period4": period4,
        "overtime": overtime,
      };
}

class Status {
  int? code;
  String? description;
  String? type;

  Status({
    this.code,
    this.description,
    this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
        "type": type,
      };
}

class Tournament {
  String? name;
  String? slug;
  Category? category;
  UniqueTournament? uniqueTournament;
  int? priority;
  int? id;

  Tournament({
    this.name,
    this.slug,
    this.category,
    this.uniqueTournament,
    this.priority,
    this.id,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        name: json["name"],
        slug: json["slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        uniqueTournament: json["uniqueTournament"] == null
            ? null
            : UniqueTournament.fromJson(json["uniqueTournament"]),
        priority: json["priority"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "category": category?.toJson(),
        "uniqueTournament": uniqueTournament?.toJson(),
        "priority": priority,
        "id": id,
      };
}

class Category {
  String? name;
  String? slug;
  Sport? sport;
  int? id;
  String? flag;
  String? alpha2;

  Category({
    this.name,
    this.slug,
    this.sport,
    this.id,
    this.flag,
    this.alpha2,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        slug: json["slug"],
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        id: json["id"],
        flag: json["flag"],
        alpha2: json["alpha2"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "sport": sport?.toJson(),
        "id": id,
        "flag": flag,
        "alpha2": alpha2,
      };
}

class UniqueTournament {
  String? name;
  String? slug;
  Category? category;
  int? userCount;
  int? id;
  bool? hasEventPlayerStatistics;
  bool? crowdsourcingEnabled;
  bool? hasPerformanceGraphFeature;
  bool? displayInverseHomeAwayTeams;

  UniqueTournament({
    this.name,
    this.slug,
    this.category,
    this.userCount,
    this.id,
    this.hasEventPlayerStatistics,
    this.crowdsourcingEnabled,
    this.hasPerformanceGraphFeature,
    this.displayInverseHomeAwayTeams,
  });

  factory UniqueTournament.fromJson(Map<String, dynamic> json) =>
      UniqueTournament(
        name: json["name"],
        slug: json["slug"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        userCount: json["userCount"],
        id: json["id"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        crowdsourcingEnabled: json["crowdsourcingEnabled"],
        hasPerformanceGraphFeature: json["hasPerformanceGraphFeature"],
        displayInverseHomeAwayTeams: json["displayInverseHomeAwayTeams"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "category": category?.toJson(),
        "userCount": userCount,
        "id": id,
        "hasEventPlayerStatistics": hasEventPlayerStatistics,
        "crowdsourcingEnabled": crowdsourcingEnabled,
        "hasPerformanceGraphFeature": hasPerformanceGraphFeature,
        "displayInverseHomeAwayTeams": displayInverseHomeAwayTeams,
      };
}
