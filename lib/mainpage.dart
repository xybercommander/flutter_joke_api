import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jokes_app/api.dart';
import 'package:jokes_app/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {  
  ScrollController _hideBottomNavController;
  bool _isVisible = true;

  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideBottomNavController = ScrollController();
    _hideBottomNavController.addListener(
      () {
        print(_hideBottomNavController.position);
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_isVisible)
            setState(() {
              _isVisible = false;
            });
        }
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isVisible)
            setState(() {
              _isVisible = true;
            });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes Page', style: TextStyle(color: Colors.purple, fontSize: 30),),
        centerTitle: true,      
        backgroundColor: Colors.transparent,  
        elevation: 0,
      ),

      body: ListView.builder(
        controller: _hideBottomNavController,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 80,
          width: MediaQuery.of(context).size.width,          
          child: Card(
            elevation: 10,
            child: Center(
              child: Text('Card $index'),
            ),
          ),
        ),
      ),

      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisible ? 56 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  label: 'Info'
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}