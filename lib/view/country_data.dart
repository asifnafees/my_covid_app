
import 'package:flutter/material.dart';
import 'package:my_covid_app/models/country_data_model.dart';
import 'package:my_covid_app/services/api_service.dart';
import 'package:shimmer/shimmer.dart';
class CountryData extends StatefulWidget {
  const CountryData({super.key});

  @override
  State<CountryData> createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {
  ApiService apiService=ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white70,
      body:
      Expanded(
          child: Center(
            child: FutureBuilder<List<CountryDataModel>>(
              future: apiService.fetchCovidData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading:Container(height: 50, width: 50,
                              color: Colors.white,),
                            title: Container(height: 10,
                              width: MediaQuery.of(context).size.width*.8,
                              color: Colors.white,),
                            subtitle: Container(height: 15,
                              width: MediaQuery.of(context).size.width*.8,
                              color: Colors.white,),
                          );
                        },
                      ),
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final covidData = snapshot.data![index];
                      return ListTile(
                        leading: Image(height: 50,width: 50,
                            image: NetworkImage(covidData.flag)),
                        title: Text(covidData.country),
                        subtitle: Text(
                            'Cases: ${covidData.cases},'
                                'Deaths: ${covidData.deaths}, '
                                'Recovered: ${covidData.recovered}'),

                      );

                    },
                  );
                }
              },
            ),
          ),
      ));

  }
}
