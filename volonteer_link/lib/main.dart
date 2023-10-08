import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'rejestracja.dart' as r;
import 'package:flutter/services.dart' show rootBundle;
import 'productModel.dart' as pM;

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
    var deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Volonteerly',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => r.Rejestracja01(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ...drawerTabs.map(
                (e) => ListTile(
                  title: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(deviceHeight / 25),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.copyright),
                    const SizedBox(width: 8), // Add some spacing
                    Text(
                      'Copyright 2023',
                      style: TextStyle(
                        fontSize: 14, // Adjust the font size as needed
                        color: Colors.grey, // Customize the color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

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
                            subtitle: Text(events[index].date),
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
      ),
    );
  }
}
