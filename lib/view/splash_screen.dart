import 'package:flutter/material.dart';
import 'package:my_covid_app/view/constants.dart';
import 'package:my_covid_app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GlobalInfo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/spImage.png'),
            SizedBox(height:
            MediaQuery.of(context).size.height*.005),
            Text('Covid-19',style: customSplashTextStyle,),
            SizedBox(height:
            MediaQuery.of(context).size.height*.005),
            CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
