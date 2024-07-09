import 'package:flutter/material.dart';
import 'package:my_covid_app/view/country_data.dart';
import 'package:my_covid_app/view/custom_button.dart';
import 'package:my_covid_app/view/reusable_row.dart';
import '../models/global_data.dart';
import '../services/api_service.dart';
import 'package:pie_chart/pie_chart.dart';

class  GlobalInfo extends StatelessWidget {
  final ApiService apiService = ApiService();//create object

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white54,
      body: FutureBuilder<GlobalData>(
        future: apiService.fetchGlobalData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            GlobalData data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                PieChart(
                dataMap: {
                  "Cases":double.parse(data.cases.toString()),
                  "Recovered":double.parse(data.recovered.toString()),
                  "Deaths":double.parse(data.deaths.toString()),
                },
                chartType: ChartType.ring,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                colorList: const[
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                ],
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left
                ),
              ),
                SizedBox(height: MediaQuery.of(context).size.height*.05),
                 Column(children: [
                 ReusableRow(title: "Cases",
                     value: data.cases.toString()),
                 ReusableRow(title: "Recovered",
                     value: data.recovered.toString()),
                 ReusableRow(title: "Deaths",
                     value: data.deaths.toString()),
                 ReusableRow(title: "Critical",
                     value: data.critical.toString()),
                 ReusableRow(title: "Active",
                     value: data.active.toString()),
                                  ],),
                  SizedBox(height: MediaQuery.of(context).size.height*.05),
                  CustomButton(title: "Tracks Countries",
                      press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryData(),));
                      },)
              ]),
            );
          }
        },
      ),
    );
  }
}
