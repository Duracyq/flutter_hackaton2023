import 'package:flutter/material.dart';
import 'rejestracja.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];
    //double dHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(156, 196, 15, 227),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Image.asset('assets/images/logo.png',
              Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        'Volonteerly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Twój Wolontariat w zasięgu ręki',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 80),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {}, //dodać funkcję
                icon: const Icon(Icons.person)),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(
                child: Text(
                  'Navigacja',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListView(
                    children: drawerTabs
                        .map(
                          (e) => Text(
                            e,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: const Rejestracja(),
      ),
    );
  }
}
