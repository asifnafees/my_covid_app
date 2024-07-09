import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_covid_app/view/constants.dart';

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({super.key,
    required this.title,
    required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black12,
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(title,style: customCardTextStyle,), Text(value,style: customCardTextStyle,),
          ],),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.004,),
        Divider(color: Colors.black,)
      ],),
    );
  }
}
