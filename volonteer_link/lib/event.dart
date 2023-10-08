import 'package:flutter/material.dart';
import 'config/appbarConfig.dart';
import 'config/drawerConfig.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class Event {
  String? eventName;
  String? eventAdres;
  String? eventDate;
  String? eventDescribtion;
  String? eventOrganizator;
  String? eventId;
  int? volunteersNeeded;
  int? volunteersAge;

  Event(
      {this.eventName,
      this.eventAdres,
      this.eventDate,
      this.eventDescribtion,
      this.eventOrganizator,
      this.eventId,
      this.volunteersNeeded,
      this.volunteersAge});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var event = Event(/*pobieramy dane z databasu*/);

    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(context, null),
      drawer: buildDrawerConfig(context),
    );
  }
}
