import 'dart:convert';

TournamentResponse tournamentResponseFromJson(String str) =>
    TournamentResponse.fromJson(json.decode(str));

String tournamentResponseToJson(TournamentResponse data) =>
    json.encode(data.toJson());

class TournamentResponse {
  List<TournamentData>? data;

  TournamentResponse({
    this.data,
  });

  factory TournamentResponse.fromJson(Map<String, dynamic> json) =>
      TournamentResponse(
        data: json["data"] == null
            ? []
            : List<TournamentData>.from(
                json["data"]!.map((x) => TournamentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TournamentData {
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
  bool? hasXg;
  bool? hasEventPlayerStatistics;
  bool? hasEventPlayerHeatMap;
  int? detailId;
  int? id;
  int? awayRedCards;
  int? startTimestamp;
  String? slug;
  bool? finalResultOnly;
  StatusTime? statusTime;
  LastPeriod? lastPeriod;
  int? homeRedCards;
  int? coverage;

  TournamentData({
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
    this.hasXg,
    this.hasEventPlayerStatistics,
    this.hasEventPlayerHeatMap,
    this.detailId,
    this.id,
    this.awayRedCards,
    this.startTimestamp,
    this.slug,
    this.finalResultOnly,
    this.statusTime,
    this.lastPeriod,
    this.homeRedCards,
    this.coverage,
  });

  factory TournamentData.fromJson(Map<String, dynamic> json) => TournamentData(
        tournament: json["tournament"] == null
            ? null
            : Tournament.fromJson(json["tournament"]),
        roundInfo: json["roundInfo"] == null
            ? null
            : RoundInfo.fromJson(json["roundInfo"]),
        customId: json["customId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        winnerCode: json["winnerCode"],
        homeTeam:
            json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
        awayTeam:
            json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
        homeScore: json["homeScore"] == null
            ? null
            : Score.fromJson(json["homeScore"]),
        awayScore: json["awayScore"] == null
            ? null
            : Score.fromJson(json["awayScore"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        changes:
            json["changes"] == null ? null : Changes.fromJson(json["changes"]),
        hasGlobalHighlights: json["hasGlobalHighlights"],
        hasXg: json["hasXg"],
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        hasEventPlayerHeatMap: json["hasEventPlayerHeatMap"],
        detailId: json["detailId"],
        id: json["id"],
        awayRedCards: json["awayRedCards"],
        startTimestamp: json["startTimestamp"],
        slug: json["slug"],
        finalResultOnly: json["finalResultOnly"],
        statusTime: json["statusTime"] == null
            ? null
            : StatusTime.fromJson(json["statusTime"]),
        lastPeriod: lastPeriodValues.map[json["lastPeriod"]]!,
        homeRedCards: json["homeRedCards"],
        coverage: json["coverage"],
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
        "hasXg": hasXg,
        "hasEventPlayerStatistics": hasEventPlayerStatistics,
        "hasEventPlayerHeatMap": hasEventPlayerHeatMap,
        "detailId": detailId,
        "id": id,
        "awayRedCards": awayRedCards,
        "startTimestamp": startTimestamp,
        "slug": slug,
        "finalResultOnly": finalResultOnly,
        "statusTime": statusTime?.toJson(),
        "lastPeriod": lastPeriodValues.reverse[lastPeriod],
        "homeRedCards": homeRedCards,
        "coverage": coverage,
      };
}

class Score {
  int? current;
  int? display;
  int? period1;
  int? period2;
  int? normaltime;

  Score({
    this.current,
    this.display,
    this.period1,
    this.period2,
    this.normaltime,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        current: json["current"],
        display: json["display"],
        period1: json["period1"],
        period2: json["period2"],
        normaltime: json["normaltime"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "display": display,
        "period1": period1,
        "period2": period2,
        "normaltime": normaltime,
      };
}

class Team {
  String? name;
  String? slug;
  String? shortName;
  Gender? gender;
  Sport? sport;
  int? userCount;
  String? nameCode;
  bool? disabled;
  bool? national;
  int? type;
  int? id;
  AwayTeamCountry? country;
  List<dynamic>? subTeams;
  TeamColors? teamColors;

  Team({
    this.name,
    this.slug,
    this.shortName,
    this.gender,
    this.sport,
    this.userCount,
    this.nameCode,
    this.disabled,
    this.national,
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
        gender: genderValues.map[json["gender"]]!,
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        userCount: json["userCount"],
        nameCode: json["nameCode"],
        disabled: json["disabled"],
        national: json["national"],
        type: json["type"],
        id: json["id"],
        country: json["country"] == null
            ? null
            : AwayTeamCountry.fromJson(json["country"]),
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
        "gender": genderValues.reverse[gender],
        "sport": sport?.toJson(),
        "userCount": userCount,
        "nameCode": nameCode,
        "disabled": disabled,
        "national": national,
        "type": type,
        "id": id,
        "country": country?.toJson(),
        "subTeams":
            subTeams == null ? [] : List<dynamic>.from(subTeams!.map((x) => x)),
        "teamColors": teamColors?.toJson(),
      };
}

class AwayTeamCountry {
  Alpha2? alpha2;
  CountryName? name;

  AwayTeamCountry({
    this.alpha2,
    this.name,
  });

  factory AwayTeamCountry.fromJson(Map<String, dynamic> json) =>
      AwayTeamCountry(
        alpha2: alpha2Values.map[json["alpha2"]]!,
        name: countryNameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "alpha2": alpha2Values.reverse[alpha2],
        "name": countryNameValues.reverse[name],
      };
}

enum Alpha2 { ES }

final alpha2Values = EnumValues({"ES": Alpha2.ES});

enum CountryName { SPAIN }

final countryNameValues = EnumValues({"Spain": CountryName.SPAIN});

enum Gender { M, F }

final genderValues = EnumValues({"F": Gender.F, "M": Gender.M});

class Sport {
  SportName? name;
  SportSlug? slug;
  int? id;

  Sport({
    this.name,
    this.slug,
    this.id,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        name: sportNameValues.map[json["name"]]!,
        slug: sportSlugValues.map[json["slug"]]!,
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": sportNameValues.reverse[name],
        "slug": sportSlugValues.reverse[slug],
        "id": id,
      };
}

enum SportName { FOOTBALL }

final sportNameValues = EnumValues({"Football": SportName.FOOTBALL});

enum SportSlug { FOOTBALL }

final sportSlugValues = EnumValues({"football": SportSlug.FOOTBALL});

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
  List<Change>? changes;
  int? changeTimestamp;

  Changes({
    this.changes,
    this.changeTimestamp,
  });

  factory Changes.fromJson(Map<String, dynamic> json) => Changes(
        changes: json["changes"] == null
            ? []
            : List<Change>.from(
                json["changes"]!.map((x) => changeValues.map[x]!)),
        changeTimestamp: json["changeTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "changes": changes == null
            ? []
            : List<dynamic>.from(changes!.map((x) => changeValues.reverse[x])),
        "changeTimestamp": changeTimestamp,
      };
}

enum Change {
  STATUS_CODE,
  STATUS_DESCRIPTION,
  STATUS_TYPE,
  HOME_SCORE_PERIOD2,
  HOME_SCORE_NORMALTIME,
  AWAY_SCORE_PERIOD2,
  AWAY_SCORE_NORMALTIME,
  TIME_CURRENT_PERIOD_START,
  AWAY_SCORE_CURRENT,
  AWAY_SCORE_DISPLAY,
  HOME_SCORE_CURRENT,
  HOME_SCORE_DISPLAY,
  CARDS_CODE
}

final changeValues = EnumValues({
  "awayScore.current": Change.AWAY_SCORE_CURRENT,
  "awayScore.display": Change.AWAY_SCORE_DISPLAY,
  "awayScore.normaltime": Change.AWAY_SCORE_NORMALTIME,
  "awayScore.period2": Change.AWAY_SCORE_PERIOD2,
  "cardsCode": Change.CARDS_CODE,
  "homeScore.current": Change.HOME_SCORE_CURRENT,
  "homeScore.display": Change.HOME_SCORE_DISPLAY,
  "homeScore.normaltime": Change.HOME_SCORE_NORMALTIME,
  "homeScore.period2": Change.HOME_SCORE_PERIOD2,
  "status.code": Change.STATUS_CODE,
  "status.description": Change.STATUS_DESCRIPTION,
  "status.type": Change.STATUS_TYPE,
  "time.currentPeriodStart": Change.TIME_CURRENT_PERIOD_START
});

enum LastPeriod { PERIOD2, PERIOD1 }

final lastPeriodValues =
    EnumValues({"period1": LastPeriod.PERIOD1, "period2": LastPeriod.PERIOD2});

class RoundInfo {
  int? round;
  String? name;
  String? slug;
  int? cupRoundType;

  RoundInfo({
    this.round,
    this.name,
    this.slug,
    this.cupRoundType,
  });

  factory RoundInfo.fromJson(Map<String, dynamic> json) => RoundInfo(
        round: json["round"],
        name: json["name"],
        slug: json["slug"],
        cupRoundType: json["cupRoundType"],
      );

  Map<String, dynamic> toJson() => {
        "round": round,
        "name": name,
        "slug": slug,
        "cupRoundType": cupRoundType,
      };
}

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

enum Description { ENDED, THE_2_ND_HALF, THE_1_ST_HALF }

final descriptionValues = EnumValues({
  "Ended": Description.ENDED,
  "1st half": Description.THE_1_ST_HALF,
  "2nd half": Description.THE_2_ND_HALF
});

enum Type { FINISHED, INPROGRESS }

final typeValues =
    EnumValues({"finished": Type.FINISHED, "inprogress": Type.INPROGRESS});

class StatusTime {
  String? prefix;
  int? initial;
  int? max;
  int? timestamp;
  int? extra;

  StatusTime({
    this.prefix,
    this.initial,
    this.max,
    this.timestamp,
    this.extra,
  });

  factory StatusTime.fromJson(Map<String, dynamic> json) => StatusTime(
        prefix: json["prefix"],
        initial: json["initial"],
        max: json["max"],
        timestamp: json["timestamp"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "initial": initial,
        "max": max,
        "timestamp": timestamp,
        "extra": extra,
      };
}

class Time {
  int? injuryTime1;
  int? injuryTime2;
  int? currentPeriodStartTimestamp;
  int? initial;
  int? max;
  int? extra;

  Time({
    this.injuryTime1,
    this.injuryTime2,
    this.currentPeriodStartTimestamp,
    this.initial,
    this.max,
    this.extra,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        injuryTime1: json["injuryTime1"],
        injuryTime2: json["injuryTime2"],
        currentPeriodStartTimestamp: json["currentPeriodStartTimestamp"],
        initial: json["initial"],
        max: json["max"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "injuryTime1": injuryTime1,
        "injuryTime2": injuryTime2,
        "currentPeriodStartTimestamp": currentPeriodStartTimestamp,
        "initial": initial,
        "max": max,
        "extra": extra,
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
  CountryName? name;
  Flag? slug;
  Sport? sport;
  int? id;
  Flag? flag;
  Alpha2? alpha2;

  Category({
    this.name,
    this.slug,
    this.sport,
    this.id,
    this.flag,
    this.alpha2,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: countryNameValues.map[json["name"]]!,
        slug: flagValues.map[json["slug"]]!,
        sport: json["sport"] == null ? null : Sport.fromJson(json["sport"]),
        id: json["id"],
        flag: flagValues.map[json["flag"]]!,
        alpha2: alpha2Values.map[json["alpha2"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": countryNameValues.reverse[name],
        "slug": flagValues.reverse[slug],
        "sport": sport?.toJson(),
        "id": id,
        "flag": flagValues.reverse[flag],
        "alpha2": alpha2Values.reverse[alpha2],
      };
}

enum Flag { SPAIN }

final flagValues = EnumValues({"spain": Flag.SPAIN});

class UniqueTournament {
  UniqueTournamentName? name;
  UniqueTournamentSlug? slug;
  PrimaryColorHex? primaryColorHex;
  SecondaryColorHex? secondaryColorHex;
  Category? category;
  int? userCount;
  int? id;
  UniqueTournamentCountry? country;
  bool? hasEventPlayerStatistics;
  bool? crowdsourcingEnabled;
  bool? hasPerformanceGraphFeature;
  bool? displayInverseHomeAwayTeams;

  UniqueTournament({
    this.name,
    this.slug,
    this.primaryColorHex,
    this.secondaryColorHex,
    this.category,
    this.userCount,
    this.id,
    this.country,
    this.hasEventPlayerStatistics,
    this.crowdsourcingEnabled,
    this.hasPerformanceGraphFeature,
    this.displayInverseHomeAwayTeams,
  });

  factory UniqueTournament.fromJson(Map<String, dynamic> json) =>
      UniqueTournament(
        name: uniqueTournamentNameValues.map[json["name"]]!,
        slug: uniqueTournamentSlugValues.map[json["slug"]]!,
        primaryColorHex: primaryColorHexValues.map[json["primaryColorHex"]]!,
        secondaryColorHex:
            secondaryColorHexValues.map[json["secondaryColorHex"]]!,
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        userCount: json["userCount"],
        id: json["id"],
        country: json["country"] == null
            ? null
            : UniqueTournamentCountry.fromJson(json["country"]),
        hasEventPlayerStatistics: json["hasEventPlayerStatistics"],
        crowdsourcingEnabled: json["crowdsourcingEnabled"],
        hasPerformanceGraphFeature: json["hasPerformanceGraphFeature"],
        displayInverseHomeAwayTeams: json["displayInverseHomeAwayTeams"],
      );

  Map<String, dynamic> toJson() => {
        "name": uniqueTournamentNameValues.reverse[name],
        "slug": uniqueTournamentSlugValues.reverse[slug],
        "primaryColorHex": primaryColorHexValues.reverse[primaryColorHex],
        "secondaryColorHex": secondaryColorHexValues.reverse[secondaryColorHex],
        "category": category?.toJson(),
        "userCount": userCount,
        "id": id,
        "country": country?.toJson(),
        "hasEventPlayerStatistics": hasEventPlayerStatistics,
        "crowdsourcingEnabled": crowdsourcingEnabled,
        "hasPerformanceGraphFeature": hasPerformanceGraphFeature,
        "displayInverseHomeAwayTeams": displayInverseHomeAwayTeams,
      };
}

class UniqueTournamentCountry {
  UniqueTournamentCountry();

  factory UniqueTournamentCountry.fromJson(Map<String, dynamic> json) =>
      UniqueTournamentCountry();

  Map<String, dynamic> toJson() => {};
}

enum UniqueTournamentName {
  LA_LIGA,
  LA_LIGA_2,
  PRIMERA_FEDERACIN,
  SEGUNDA_FEDERACIN,
  LIGA_F
}

final uniqueTournamentNameValues = EnumValues({
  "LaLiga": UniqueTournamentName.LA_LIGA,
  "LaLiga 2": UniqueTournamentName.LA_LIGA_2,
  "Liga F": UniqueTournamentName.LIGA_F,
  "Primera Federación": UniqueTournamentName.PRIMERA_FEDERACIN,
  "Segunda Federación": UniqueTournamentName.SEGUNDA_FEDERACIN
});

enum PrimaryColorHex { THE_2_F4_A89, FE0235, THE_34_CFFA, THE_5_C9_CD4 }

final primaryColorHexValues = EnumValues({
  "#fe0235": PrimaryColorHex.FE0235,
  "#2f4a89": PrimaryColorHex.THE_2_F4_A89,
  "#34cffa": PrimaryColorHex.THE_34_CFFA,
  "#5c9cd4": PrimaryColorHex.THE_5_C9_CD4
});

enum SecondaryColorHex { F4_A32_E, E89823, THE_8_C8_C8_C, THE_919191, F7_A600 }

final secondaryColorHexValues = EnumValues({
  "#e89823": SecondaryColorHex.E89823,
  "#f4a32e": SecondaryColorHex.F4_A32_E,
  "#f7a600": SecondaryColorHex.F7_A600,
  "#8c8c8c": SecondaryColorHex.THE_8_C8_C8_C,
  "#919191": SecondaryColorHex.THE_919191
});

enum UniqueTournamentSlug {
  LALIGA,
  LALIGA_2,
  PRIMERA_FEDERACION,
  SEGUNDA_FEDERACION,
  LIGA_F
}

final uniqueTournamentSlugValues = EnumValues({
  "laliga": UniqueTournamentSlug.LALIGA,
  "laliga-2": UniqueTournamentSlug.LALIGA_2,
  "liga-f": UniqueTournamentSlug.LIGA_F,
  "primera-federacion": UniqueTournamentSlug.PRIMERA_FEDERACION,
  "segunda-federacion": UniqueTournamentSlug.SEGUNDA_FEDERACION
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
