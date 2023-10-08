import 'package:flutter/material.dart';
import 'package:volonteer_link/config/drawerConfig.dart';
import 'package:volonteer_link/config/kreator.dart' as kr;
import 'dart:convert' show json;
import 'rejestracja.dart' as r;
import 'package:flutter/services.dart' show rootBundle;
import 'productModel.dart' as pM;
import 'config/appbarConfig.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<String> drawerTabs = ["O nas", "Kontakt", "Wydarzenia", "Chat"];

  late Future<List<pM.Event>> eventsFuture; // Future to store parsed events

  Future<List<pM.Event>> loadJsonData() async {
    // Load JSON data from the assets folder
    String jsonData = await rootBundle.loadString('assets/events.json');
    List<dynamic> jsonList = json.decode(jsonData);

    // Parse JSON data into a list of Event objects
    List<pM.Event> events = jsonList.map((json) => pM.Event.fromJson(json)).toList();
    
    return events;
  }

  @override
  void initState() {
    super.initState();
    eventsFuture = loadJsonData(); // Load JSON data when the app starts
  }
  @override
  Widget build(BuildContext context) {
    // var deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(context, null),
        drawer: buildDrawerConfig(context),

        body: FutureBuilder<List<pM.Event>>(
          future: eventsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No events available.'));
            } else {
              List<pM.Event> events = snapshot.data!;
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Wydarzenia:',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          // Display event information using ListTile
                          return ListTile(
                            title: Text(events[index].title),
                            subtitle: Text(events[index].desc),
                            onTap: () {
                              // Handle event tap
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => kr.Tworzenie()));
          },
          child: Icon(Icons.add),
          
        ),
      ),
    );
  }
}
