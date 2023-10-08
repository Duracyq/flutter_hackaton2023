import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:volonteer_link/config/drawerConfig.dart';
import 'package:volonteer_link/config/kreator.dart' as kr;
import 'dart:convert' show json;
import 'rejestracja.dart' as r;
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
    List<pM.Event> events =
        jsonList.map((json) => pM.Event.fromJson(json)).toList();

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(context, null),
        drawer: buildDrawerConfig(context),
        body: Column(
          children: [
            Container(
              width: width * 0.8,
              height: 60,
              child: Center(
                child: Text(
                  'Wydarzenia',
                  style: GoogleFonts.mooli(
                    // Ustawienie czcionki Open Sans
                    textStyle: const TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 55, 0, 61),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.3, // Ustaw wysokość kontenera
              child: FutureBuilder<List<pM.Event>>(
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
                    return ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Ustaw kierunek przewijania
                      itemCount: events.length, // Ilość kontenerów
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: width / 1.5,
                          height: height * 0.5,
                          // Ustaw kolor
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 237, 237),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Kolor cienia
                                spreadRadius: 5, // Rozprzestrzenianie cienia
                                blurRadius: 7, // Rozmycie cienia
                                offset:
                                    Offset(0, 3), // Przesunięcie cienia (x, y)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Zdjęcie Organizatora",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    events[index]
                                        .title, // Event title from JSON
                                    style: GoogleFonts.mooli(
                                      // Ustawienie czcionki Open Sans
                                      textStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromARGB(255, 55, 0, 61),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Miejsce: ${events[index].place}',
                                    style: GoogleFonts.mooli(
                                      // Ustawienie czcionki Open Sans
                                      textStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromARGB(255, 55, 0, 61),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'Data',
                                    style: GoogleFonts.mooli(
                                      // Ustawienie czcionki Open Sans
                                      textStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromARGB(255, 55, 0, 61),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromRGBO(222, 58, 214, 1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "13", // Current occupied seats
                                          style: GoogleFonts.mooli(
                                            // Ustawienie czcionki Open Sans
                                            textStyle: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "/",
                                          style: GoogleFonts.mooli(
                                            // Ustawienie czcionki Open Sans
                                            textStyle: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "20", // Total seats
                                          style: GoogleFonts.mooli(
                                            // Ustawienie czcionki Open Sans
                                            textStyle: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ), // Dodaj odstęp między kontenerami
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    child: Text(
                      'Chats',
                      style: GoogleFonts.mooli(
                        // Ustawienie czcionki Open Sans
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 55, 0, 61),

                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Text(
                      '(in progress...)',
                      style: GoogleFonts.mooli(
                        // Ustawienie czcionki Open Sans
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 134, 146, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical, // Ustaw kierunek przewijania
                itemCount: 5, // Ilość kontenerów
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: width * 0.8,
                    height: height * 0.13,
                    // Ustaw kolor
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 237, 237),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Kolor cienia
                          spreadRadius: 5, // Rozprzestrzenianie cienia
                          blurRadius: 7, // Rozmycie cienia
                          offset: Offset(0, 3), // Przesunięcie cienia (x, y)
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: const Center(
                            child: Text("Zdjęcie"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'John Bravo',
                          style: GoogleFonts.mooli(
                            // Ustawienie czcionki Open Sans
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color.fromARGB(255, 55, 0, 61),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 120,
                          child: Text(
                            '"(Ostatnie wpisy z grupy lub prywatne)"',
                            style: GoogleFonts.mooli(
                              // Ustawienie czcionki Open Sans
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 65, 50, 66),
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ), // Dodaj odstęp między kontenerami
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => kr.Tworzenie()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );

  }
}
