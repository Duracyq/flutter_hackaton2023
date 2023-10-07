import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(const MyApp());
}

class Event {
  final int id;
  final String title;
  final String desc;
  final String organizator;

  Event({
    required this.id,
    required this.title,
    required this.desc,
    required this.organizator,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      organizator: json['organizator'],
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Event> events;

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    events = jsonList.map((json) => Event.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event List'),
        ),
        body: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            Event event = events[index];
            return ListTile(
              title: Text(event.title),
              subtitle: Text(event.desc),
              trailing: Text(event.organizator),
            );
          },
        ),
      ),
    );
  }
}

