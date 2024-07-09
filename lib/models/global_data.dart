class GlobalData {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;

  GlobalData({
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.critical,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
  });

  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      todayCases: json['todayCases'],
      todayDeaths: json['todayDeaths'],
      todayRecovered: json['todayRecovered'],
    );
  }
}
