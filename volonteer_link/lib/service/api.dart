import "dart:convert";
import "package:http/http.dart" as http;
import "package:flutter/foundation.dart";
import "package:volonteer_link/main.dart";

class YourData {
  final String? id;
  final Map<String, String> trec;

  YourData({
    this.id,
    required this.trec,
  });

  factory YourData.fromJson(Map<String, dynamic> json) {
    return YourData(
      id: json['ID'],
      trec: (json['TRESC'] as Map<String, dynamic>).cast<String, String>(),
    );
  }
}

class Api {
  static const baseUrl = 'http://192.168.150.83/api/';

  static createUser(Map udata) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/postUser'), body: udata);
      if(res.statusCode != 200) {
        print('Failed to get response');
      }
      else {
        var data = jsonDecode(res.body.toString());
        print(data);
      }

    }catch(e){
      print(e);
    }
  }
  static createEvent(Map edata) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/postEvent'), body: edata);
      if(res.statusCode != 200) {
        print('Failed to get response');
      }
      else {
        var data = jsonDecode(res.body.toString());
        print(data);
      }

    }catch(e){
      print(e);
    }
  }

  static Future<List<YourData>> getProduct() async { // ta funkcja
    List<YourData> yourdata = [];
    try {
      final res = await http.get(Uri.parse('$baseUrl/read'));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (data['TRESC'] is Map<String, dynamic>) {
          yourdata.add(YourData.fromJson(data));
        }
        return yourdata;
      } else {
        print('Failed to fetch data: ${res.statusCode}');
        return yourdata;
      }
    } catch (err) {
      print('Error: $err');
      return yourdata;
    }
  }
}
