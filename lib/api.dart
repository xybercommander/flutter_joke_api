import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:jokes_app/constants.dart';

class JokesApi {

  Future<void> callJokesApi() async {
    
    var url = Uri.parse('https://official-joke-api.appspot.com/random_ten');
    Response response = await get(url);
    var data = jsonDecode(response.body);
    // print(data);
    Map<dynamic, dynamic> joke = data[Random().nextInt(data.length)];
    Constants.jokeSetup =  joke['setup'];
    Constants.jokePunchline =  joke['punchline'];
    print(Constants.jokeSetup);
    print(Constants.jokePunchline);

  }

}