
import 'dart:convert';

import 'package:http/http.dart' as http;


class RestApi{
  String host = "http://192.168.2.10:8000/";
  String routeAddress = "getaddress";
  getAddress(String prompt)async{
    String url = 'http://192.168.2.10:5000/getaddress';

    final response = await http.post(Uri.parse(url),
        headers: <String,String>{'Content-Type':'application/json; charset=UTF-8'},
        body: jsonEncode(<String,String>{'prompt':prompt}));
    print(response.body);
    return jsonDecode(response.body)['address'];
  }

}