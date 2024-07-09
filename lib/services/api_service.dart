import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/global_data.dart';
import 'package:my_covid_app/models/country_data_model.dart';

class ApiService {
  static const String url = 'https://disease.sh/v3/covid-19/all';
  static const String url2 = 'https://disease.sh/v3/covid-19/countries';

  Future<GlobalData> fetchGlobalData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return GlobalData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load global data');
    }
  }


  Future<List<CountryDataModel>> fetchCovidData() async {
    final response = await http.get(Uri.parse(url2));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => CountryDataModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
