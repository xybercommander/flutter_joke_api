import 'package:flutter/material.dart';
import 'package:jokes_app/api.dart';
import 'package:jokes_app/mainpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  JokesApi jokesApi = JokesApi();

  initFunction() async {
    await jokesApi.callJokesApi();
    Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainPage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();    
    initFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola!', style: TextStyle(fontSize: 60),),
      )
    );
  }
}