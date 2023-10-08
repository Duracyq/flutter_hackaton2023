import 'dart:convert';

import 'package:flutter/services.dart';

class UserModule {
  late final int id;
  late final String uname;
  late final String sname;
  late final String pesel;
  late final String address;
  late final String phonenum;
  late final String email;
  late final int age;
  late final String role;
  late final bool regulamin;

  UserModule({
    required this.id,
    required this.uname,
    required this.sname,
    required this.pesel,
    required this.phonenum,
    required this.email,
    required this.age,
    required this.role,
    required this.regulamin,
  });

  factory UserModule.fromJson(Map<String, dynamic> json) {
    return UserModule(
      id: json['id'],
      uname: json['uname'],
      sname: json['sname'],
      pesel: json['pesel'],
      phonenum: json['phonenum'],
      email: json['email'],
      age: json['age'],
      role: json['role'],
      regulamin: json['regulamin'],
    );
  }

// Parse the JSON data into a list of User objects
  List<UserModule> parseUsers(String jsonStr) {
    final List<dynamic> jsonData = json.decode(jsonStr);
    return jsonData.map((user) => UserModule.fromJson(user)).toList();
  }

  Future<List<UserModule>> loadUsersFromJsonFile() async {
    try {
      // Load the JSON file from the assets folder
      String jsonString = await rootBundle.loadString('assets/user.json');

      // Parse the JSON data into a list of User objects
      final jsonData = json.decode(jsonString);
      List<UserModule> users = jsonData
          .map<UserModule>((user) => UserModule.fromJson(user))
          .toList();

      return users;
    } catch (e) {
      // Handle any errors that may occur during loading or parsing
      print('Error loading JSON data: $e');
      return [];
    }
  }
}

class Event {
  final int id;
  final String title;
  final String desc;
  final String organizator;
  final String addr;
  final String date;

  Event(
      {required this.id,
      required this.title,
      required this.desc,
      required this.organizator,
      required this.addr,
      required this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        organizator: json['organizator'],
        addr: json['addr'],
        date: json['date']);
  }
}
