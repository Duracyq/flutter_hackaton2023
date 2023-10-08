// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
import './productModel.dart' as pM;
import './config/appbarConfig.dart';
import 'config/drawerConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Events(),
      ),
    );
  }
}

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
    return Scaffold(
      appBar: buildAppBar(context, null),
      drawer: buildDrawerConfig(context),
      body: FutureBuilder<List<pM.Event>>(
        future: eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<pM.Event> events = snapshot.data ?? [];

            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                pM.Event event = events[index];
                return EventCard(event: event);
              },
            );
          }
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final pM.Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    // You can use the 'event' object to display event details here
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(131, 116, 116, 0.25),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(0, 0, 0, 0.612),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Data: ${event.date}', // Replace with the actual date field from your Event class
            style: GoogleFonts.rem(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(0, 0, 0, 0.612),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Miejsce: ${event.addr}', // Replace with the actual location field from your Event class
            style: GoogleFonts.rem(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(0, 0, 0, 0.612),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: SeeMoreText(event.desc),
          ),
          SizedBox(height: 16),
          Text(
            'Organizator: ${event.organizator}', // Replace with the actual organizer field from your Event class
            style: GoogleFonts.rem(
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(0, 0, 0, 0.612),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Center(child: Text("Zdjęcie")),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    event.organizator, // Replace with the actual organizer's name
                    style: GoogleFonts.rem(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(0, 0, 0, 0.612),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Organizacja', // Replace with the actual organizer's organization
                    style: GoogleFonts.rem(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color.fromRGBO(0, 0, 0, 0.612),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(222, 58, 214, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Zapisz się ',
                style: GoogleFonts.rem(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeeMoreText extends StatefulWidget {
  final String fullText;

  SeeMoreText(this.fullText);

  @override
  _SeeMoreTextState createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          isExpanded
              ? widget.fullText
              : widget.fullText
                  .substring(0, 100), // Ograniczenie tekstu do 100 znaków
          textAlign: TextAlign.justify,
          style: GoogleFonts.rem(
            textStyle: TextStyle(
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(0, 0, 0, 0.612),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(isExpanded ? 'Zobacz mniej' : 'Zobacz więcej'),
        ),
      ],
    );
  }
}
