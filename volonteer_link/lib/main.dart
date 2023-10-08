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
  late List<pM.Event> events; // List to store parsed events
  late List<String> drawerTabs = ["O nas", "Kontakt", "Wydarzenia", "Chat"];

  Future<void> loadJsonData() async {
    // Load JSON data from the assets folder
    String jsonData = await rootBundle.loadString('assets/events.json');
    List<dynamic> jsonList = json.decode(jsonData);

    // Parse JSON data into a list of Event objects
    events = jsonList.map((json) => pM.Event.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // Load JSON data when the app starts
  }

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => r.Rejestracja(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: drawerTabs
                .map(
                  (e) => ListTile(
                    title: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
