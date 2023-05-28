import 'dart:convert';

FootballModel footballModelFromJson(String str) => FootballModel.fromJson(json.decode(str));

String footballModelToJson(FootballModel data) => json.encode(data.toJson());

class FootballModel {
  List<Datum>? data;

  FootballModel({
    this.data,
  });

  factory FootballModel.fromJson(Map<String, dynamic> json) => FootballModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Tournament? tournament;
  RoundInfo? roundInfo;
  String? customId;
  Status? status;
  int? winnerCode;
  Team? homeTeam;
  Team? awayTeam;
  Score? homeScore;
  Score? awayScore;
  Time? time;
  Changes? changes;
  bool? hasGlobalHighlights;
  bool? hasEventPlayerStatistics;
  bool? hasEventPlayerHeatMap;
  int? detailId;
  bool? crowdsourcingDataDisplayEnabled;
  int? id;
  int? startTimestamp;
  String? slug;
  bool? finalResultOnly;
  int? awayRedCards;
  int? homeRedCards;
  int? aggregatedWinnerCode;
  int? previousLegEventId;
  bool? isAwarded;

  Datum({
    this.tournament,
    this.roundInfo,
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
    this.hasEventPlayerStatistics,
    this.hasEventPlayerHeatMap,
    this.detailId,
    this.crowdsourcingDataDisplayEnabled,
    this.id,
    this.startTimestamp,
    this.slug,
    this.finalResultOnly,
    this.awayRedCards,
    this.homeRedCards,
    this.aggregatedWinnerCode,
    this.previousLegEventId,
    this.isAwarded,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tournament: json["tournament"] == null ? null : Tournament.fromJson(json["tournament"]),
    roundInfo: json["roundInfo"] == null ? null : RoundInfo.fromJson(json["roundInfo"]),
    customId: json["customId"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    winnerCode: json["winnerCode"],
    homeTeam: json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
    homeScore: json["homeScore"] == null ? null : Score.fromJson(json["homeScore"]),
    awayScore: json["awayScore"] == null ? null : Score.fromJson(json["awayScore"]),
    time: json["time"] == null ? null : Time.fromJson(json["time"]),
    changes: json["changes"] == null ? null : Changes.fromJson(json["changes"]),
    hasGlobalHighlights: json["hasGlobalHighlights"],
    hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
    hasEventPlayerHeatMap: json["hasEventPlayerHeatMap"],
    detailId: json["detailId"],
    crowdsourcingDataDisplayEnabled: json["crowdsourcingDataDisplayEnabled"],
    id: json["id"],
    startTimestamp: json["startTimestamp"],
    slug: json["slug"],
    finalResultOnly: json["finalResultOnly"],
    awayRedCards: json["awayRedCards"],
    homeRedCards: json["homeRedCards"],
    aggregatedWinnerCode: json["aggregatedWinnerCode"],
    previousLegEventId: json["previousLegEventId"],
    isAwarded: json["isAwarded"],
  );

  Map<String, dynamic> toJson() => {
    "tournament": tournament?.toJson(),
    "roundInfo": roundInfo?.toJson(),
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
    "hasEventPlayerStatistics": hasEventPlayerStatistics,
    "hasEventPlayerHeatMap": hasEventPlayerHeatMap,
    "detailId": detailId,
    "crowdsourcingDataDisplayEnabled": crowdsourcingDataDisplayEnabled,
    "id": id,
    "startTimestamp": startTimestamp,
    "slug": slug,
    "finalResultOnly": finalResultOnly,
    "awayRedCards": awayRedCards,
    "homeRedCards": homeRedCards,
    "aggregatedWinnerCode": aggregatedWinnerCode,
    "previousLegEventId": previousLegEventId,
    "isAwarded": isAwarded,
  };
}

class Score {
  int? current;
  int? display;
  int? period1;
  int? period2;
  int? normaltime;
  int? aggregated;
  int? overtime;
  int? extra1;
  int? extra2;
  int? penalties;

  Score({
    this.current,
    this.display,
    this.period1,
    this.period2,
    this.normaltime,
    this.aggregated,
    this.overtime,
    this.extra1,
    this.extra2,
    this.penalties,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    current: json["current"],
    display: json["display"],
    period1: json["period1"],
    period2: json["period2"],
    normaltime: json["normaltime"],
    aggregated: json["aggregated"],
    overtime: json["overtime"],
    extra1: json["extra1"],
    extra2: json["extra2"],
    penalties: json["penalties"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "display": display,
    "period1": period1,
    "period2": period2,
    "normaltime": normaltime,
    "aggregated": aggregated,
    "overtime": overtime,
    "extra1": extra1,
    "extra2": extra2,
    "penalties": penalties,
  };
}

class Team {
  String? name;
  String? slug;
  String? shortName;
  Sport? sport;
  int? userCount;
  String? nameCode;
  bool? disabled;
  int? type;
  int? id;
  AwayTeamCountry? country;
  List<dynamic>? subTeams;
  TeamColors? teamColors;
  Gender? gender;
  bool? national;

  Team({
    this.name,
    this.slug,
    this.shortName,
    this.sport,
    this.userCount,
    this.nameCode,
    this.disabled,
    this.type,
    this.id,
    this.country,
    this.subTeams,
    this.teamColors,
    this.gender,
    this.national,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    name: json["name"],
    slug: json["slug"],
    shortName: json["shortName"],
    sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
    userCount: json["userCount"],
    nameCode: json["nameCode"],
    disabled: json["disabled"],
    type: json["type"],
    id: json["id"],
    country: json["country"] == null ? null : AwayTeamCountry.fromJson(json["country"]),
    subTeams: json["subTeams"] == null ? [] : List<dynamic>.from(json["subTeams"]!.map((x) => x)),
    teamColors: json["teamColors"] == null ? null : TeamColors.fromJson(json["teamColors"]),
    gender: genderValues.map[json["gender"]]!,
    national: json["national"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "shortName": shortName,
    "sport": sport?.toJson(),
    "userCount": userCount,
    "nameCode": nameCode,
    "disabled": disabled,
    "type": type,
    "id": id,
    "country": country?.toJson(),
    "subTeams": subTeams == null ? [] : List<dynamic>.from(subTeams!.map((x) => x)),
    "teamColors": teamColors?.toJson(),
    "gender": genderValues.reverse[gender],
    "national": national,
  };
}

class AwayTeamCountry {
  String? alpha2;
  String? name;

  AwayTeamCountry({
    this.alpha2,
    this.name,
  });

  factory AwayTeamCountry.fromJson(Map<String, dynamic> json) => AwayTeamCountry(
    alpha2: json["alpha2"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "alpha2": alpha2,
    "name": name,
  };
}

enum Gender { M }

final genderValues = EnumValues({
  "M": Gender.M
});

class Sport {
  SportName? name;
  Slug? slug;
  int? id;

  Sport({
    this.name,
    this.slug,
    this.id,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
    name: sportNameValues.map[json["name"]]!,
    slug: slugValues.map[json["slug"]]!,
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": sportNameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "id": id,
  };
}

enum SportName { FOOTBALL }

final sportNameValues = EnumValues({
  "Football": SportName.FOOTBALL
});

enum Slug { FOOTBALL }

final slugValues = EnumValues({
  "football": Slug.FOOTBALL
});

class TeamColors {
  Primary? primary;
  Secondary? secondary;
  Secondary? text;

  TeamColors({
    this.primary,
    this.secondary,
    this.text,
  });

  factory TeamColors.fromJson(Map<String, dynamic> json) => TeamColors(
    primary: primaryValues.map[json["primary"]]!,
    secondary: secondaryValues.map[json["secondary"]]!,
    text: secondaryValues.map[json["text"]]!,
  );

  Map<String, dynamic> toJson() => {
    "primary": primaryValues.reverse[primary],
    "secondary": secondaryValues.reverse[secondary],
    "text": secondaryValues.reverse[text],
  };
}

enum Primary { THE_52_B030, THE_990000, FFFFFF, THE_66192_C, THE_542_BAA, EDE664, FF0000, THE_62_C0_FF, THE_0000_CC, FF1300, FFBF00, THE_000000, THE_000099, CC0000, FFE000, FFCC00, THE_0066_CC, FF3333, THE_7_E7_E7_E }

final primaryValues = EnumValues({
  "#cc0000": Primary.CC0000,
  "#ede664": Primary.EDE664,
  "#ff0000": Primary.FF0000,
  "#ff1300": Primary.FF1300,
  "#ff3333": Primary.FF3333,
  "#ffbf00": Primary.FFBF00,
  "#ffcc00": Primary.FFCC00,
  "#ffe000": Primary.FFE000,
  "#ffffff": Primary.FFFFFF,
  "#000000": Primary.THE_000000,
  "#000099": Primary.THE_000099,
  "#0000cc": Primary.THE_0000_CC,
  "#0066cc": Primary.THE_0066_CC,
  "#52b030": Primary.THE_52_B030,
  "#542baa": Primary.THE_542_BAA,
  "#62c0ff": Primary.THE_62_C0_FF,
  "#66192c": Primary.THE_66192_C,
  "#7e7e7e": Primary.THE_7_E7_E7_E,
  "#990000": Primary.THE_990000
});

enum Secondary { THE_52_B030, EACA15, THE_000000, THE_59_B3_E4, FFFFFF, E04_F5_B, FF0000, THE_000099, THE_0000_CC, THE_000033, THE_222226, FF2222, CC1020, THE_990000, THE_008100, THE_66_CCFF, FFCC00, THE_0000_FF }

final secondaryValues = EnumValues({
  "#cc1020": Secondary.CC1020,
  "#e04f5b": Secondary.E04_F5_B,
  "#eaca15": Secondary.EACA15,
  "#ff0000": Secondary.FF0000,
  "#ff2222": Secondary.FF2222,
  "#ffcc00": Secondary.FFCC00,
  "#ffffff": Secondary.FFFFFF,
  "#000000": Secondary.THE_000000,
  "#000033": Secondary.THE_000033,
  "#000099": Secondary.THE_000099,
  "#0000cc": Secondary.THE_0000_CC,
  "#0000ff": Secondary.THE_0000_FF,
  "#008100": Secondary.THE_008100,
  "#222226": Secondary.THE_222226,
  "#52b030": Secondary.THE_52_B030,
  "#59b3e4": Secondary.THE_59_B3_E4,
  "#66ccff": Secondary.THE_66_CCFF,
  "#990000": Secondary.THE_990000
});

class Changes {
  List<Change>? changes;
  int? changeTimestamp;

  Changes({
    this.changes,
    this.changeTimestamp,
  });

  factory Changes.fromJson(Map<String, dynamic> json) => Changes(
    changes: json["changes"] == null ? [] : List<Change>.from(json["changes"]!.map((x) => changeValues.map[x]!)),
    changeTimestamp: json["changeTimestamp"],
  );

  Map<String, dynamic> toJson() => {
    "changes": changes == null ? [] : List<dynamic>.from(changes!.map((x) => changeValues.reverse[x])),
    "changeTimestamp": changeTimestamp,
  };
}

enum Change { STATUS_CODE, STATUS_DESCRIPTION, STATUS_TYPE, HOME_SCORE_PERIOD2, HOME_SCORE_NORMALTIME, AWAY_SCORE_PERIOD2, AWAY_SCORE_NORMALTIME, TIME_CURRENT_PERIOD_START, HOME_SCORE_OVERTIME, AWAY_SCORE_OVERTIME, TIME_INJURY_TIME2, CARDS_CODE, HOME_SCORE_DISPLAY, HOME_SCORE_PENALTIES, HOME_SCORE_AGGREGATED, AWAY_SCORE_DISPLAY, AWAY_SCORE_PENALTIES, AWAY_SCORE_AGGREGATED, TIME_INJURY_TIME1, AWAY_SCORE_CURRENT }

final changeValues = EnumValues({
  "awayScore.aggregated": Change.AWAY_SCORE_AGGREGATED,
  "awayScore.current": Change.AWAY_SCORE_CURRENT,
  "awayScore.display": Change.AWAY_SCORE_DISPLAY,
  "awayScore.normaltime": Change.AWAY_SCORE_NORMALTIME,
  "awayScore.overtime": Change.AWAY_SCORE_OVERTIME,
  "awayScore.penalties": Change.AWAY_SCORE_PENALTIES,
  "awayScore.period2": Change.AWAY_SCORE_PERIOD2,
  "cardsCode": Change.CARDS_CODE,
  "homeScore.aggregated": Change.HOME_SCORE_AGGREGATED,
  "homeScore.display": Change.HOME_SCORE_DISPLAY,
  "homeScore.normaltime": Change.HOME_SCORE_NORMALTIME,
  "homeScore.overtime": Change.HOME_SCORE_OVERTIME,
  "homeScore.penalties": Change.HOME_SCORE_PENALTIES,
  "homeScore.period2": Change.HOME_SCORE_PERIOD2,
  "status.code": Change.STATUS_CODE,
  "status.description": Change.STATUS_DESCRIPTION,
  "status.type": Change.STATUS_TYPE,
  "time.currentPeriodStart": Change.TIME_CURRENT_PERIOD_START,
  "time.injuryTime1": Change.TIME_INJURY_TIME1,
  "time.injuryTime2": Change.TIME_INJURY_TIME2
});

class RoundInfo {
  int? round;
  RoundInfoName? name;
  int? cupRoundType;

  RoundInfo({
    this.round,
    this.name,
    this.cupRoundType,
  });

  factory RoundInfo.fromJson(Map<String, dynamic> json) => RoundInfo(
    round: json["round"],
    name: roundInfoNameValues.map[json["name"]]!,
    cupRoundType: json["cupRoundType"],
  );

  Map<String, dynamic> toJson() => {
    "round": round,
    "name": roundInfoNameValues.reverse[name],
    "cupRoundType": cupRoundType,
  };
}

enum RoundInfoName { SEMIFINAL, FINAL, ROUND_OF_16 }

final roundInfoNameValues = EnumValues({
  "Final": RoundInfoName.FINAL,
  "Round of 16": RoundInfoName.ROUND_OF_16,
  "Semifinal": RoundInfoName.SEMIFINAL
});

class Status {
  int? code;
  Description? description;
  Type? type;

  Status({
    this.code,
    this.description,
    this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    code: json["code"],
    description: descriptionValues.map[json["description"]]!,
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": descriptionValues.reverse[description],
    "type": typeValues.reverse[type],
  };
}

enum Description { ENDED, AET, POSTPONED, AP, CANCELED }

final descriptionValues = EnumValues({
  "AET": Description.AET,
  "AP": Description.AP,
  "Canceled": Description.CANCELED,
  "Ended": Description.ENDED,
  "Postponed": Description.POSTPONED
});

enum Type { FINISHED, POSTPONED, CANCELED }

final typeValues = EnumValues({
  "canceled": Type.CANCELED,
  "finished": Type.FINISHED,
  "postponed": Type.POSTPONED
});

class Time {
  int? injuryTime1;
  int? injuryTime2;
  int? currentPeriodStartTimestamp;
  int? injuryTime3;
  int? injuryTime4;

  Time({
    this.injuryTime1,
    this.injuryTime2,
    this.currentPeriodStartTimestamp,
    this.injuryTime3,
    this.injuryTime4,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    injuryTime1: json["injuryTime1"],
    injuryTime2: json["injuryTime2"],
    currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
    injuryTime3: json["injuryTime3"],
    injuryTime4: json["injuryTime4"],
  );

  Map<String, dynamic> toJson() => {
    "injuryTime1": injuryTime1,
    "injuryTime2": injuryTime2,
    "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
    "injuryTime3": injuryTime3,
    "injuryTime4": injuryTime4,
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
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    uniqueTournament: json["uniqueTournament"] == null ? null : UniqueTournament.fromJson(json["uniqueTournament"]),
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
  String? primaryColorHex;
  String? secondaryColorHex;
  UniqueTournamentCountry? country;

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
    this.primaryColorHex,
    this.secondaryColorHex,
    this.country,
  });

  factory UniqueTournament.fromJson(Map<String, dynamic> json) => UniqueTournament(
    name: json["name"],
    slug: json["slug"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    userCount: json["userCount"],
    id: json["id"],
    hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
    crowdsourcingEnabled: json["crowdsourcingEnabled"],
    hasPerformanceGraphFeature: json["hasPerformanceGraphFeature"],
    displayInverseHomeAwayTeams: json["displayInverseHomeAwayTeams"],
    primaryColorHex: json["primaryColorHex"],
    secondaryColorHex: json["secondaryColorHex"],
    country: json["country"] == null ? null : UniqueTournamentCountry.fromJson(json["country"]),
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
    "primaryColorHex": primaryColorHex,
    "secondaryColorHex": secondaryColorHex,
    "country": country?.toJson(),
  };
}

class UniqueTournamentCountry {
  UniqueTournamentCountry();

  factory UniqueTournamentCountry.fromJson(Map<String, dynamic> json) => UniqueTournamentCountry(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}