import 'package:flutter/material.dart';
import 'package:my_covid_app/view/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const CustomButton({super.key,
  required this.title,
  required this.press});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(onTap: press,
        child: Container(height: MediaQuery.of(context).size.height*.07,
                        width:MediaQuery.of(context).size.width*.6,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(color: Colors.black,
               blurRadius: 5,spreadRadius: 5)
            ]
          ),
        child: Center(child: Text(title,style: customCardTextStyle,)),
      ),),
    );
  }
}
