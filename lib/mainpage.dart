import 'package:flutter/material.dart';
import 'package:jokes_app/api.dart';
import 'package:jokes_app/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes Page', style: TextStyle(color: Colors.purple, fontSize: 30),),
        centerTitle: true,      
        backgroundColor: Colors.transparent,  
        elevation: 0,
      ),

      body: Container(        
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Constants.jokeSetup,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10,),
            Text(Constants.jokePunchline, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () async {          
          await JokesApi().callJokesApi();
          setState(() {
            
          });
        },
      ),
    );
  }
}