// country_data.dart

class CountryDataModel {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final String flag;
  final int recovered;

  CountryDataModel({
    required this.country,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.flag,
    required this.recovered
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) {
    return CountryDataModel(
      country: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      flag: json['countryInfo']['flag'],
      recovered: json['recovered'],
    );
  }
}
