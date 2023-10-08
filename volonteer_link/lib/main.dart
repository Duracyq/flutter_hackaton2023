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
  late List<pM.Event> events;
  List<String> eventName = [];
  List<String> evenText = [];
  List<String> eventDate = [];
  late List<pM.Event> eventList;

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    events = jsonList.map((json) => pM.Event.fromJson(json)).toList();
  }

  List<String> drawerTabs = ["O nas", "Kontakt", "Wydarzenia", "Chat"];

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
                  child: ListView(
                    children: eventName
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
