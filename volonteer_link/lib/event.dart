import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(context, null),
      drawer: buildDrawerConfig(context),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
              width: width,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Wydarzenia',
                style: GoogleFonts.openSans(
                  // Ustawienie czcionki Open Sans
                  textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(0, 0, 0, 0.612),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.018,
              width: width,
            ),
            Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Container(
                    width: width * 0.75,
                    height: height * 0.6,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(131, 116, 116, 0.25),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                'Nazwa wydarzenia',
                                style: GoogleFonts.rem(
                                  // Ustawienie czcionki Open Sans
                                  textStyle: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromRGBO(0, 0, 0, 0.612),
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    'Data',
                                    style: GoogleFonts.rem(
                                      // Ustawienie czcionki Open Sans
                                      textStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromRGBO(0, 0, 0, 0.612),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    'Miejsce',
                                    style: GoogleFonts.rem(
                                      // Ustawienie czcionki Open Sans
                                      textStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromRGBO(0, 0, 0, 0.612),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.6,
                              child: SeeMoreText(
                                'fsgfbstzbzfjhfgsvzryuvbkzbtvsuytvkestuybesfsvbkuvbuzsegkusvbzkgvzbfsefgvsgvyjsbzgfvyjsgfvskfzsvbygfjkszgksjzgvhbvfskgksjgvbjskbvgbkjghbvhvbbvsjgvksvghkush gibg sgkurg uksrg srd gdksrbh f',
                              ),
                            ),
                            SizedBox(
                              width: width * 0.6,
                              height: height * 0.1,
                              child: const Column(
                                children: [],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Organizator',
                            style: GoogleFonts.rem(
                              // Ustawienie czcionki Open Sans
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(0, 0, 0, 0.612),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
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
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Imie Nazwisko',
                                  style: GoogleFonts.rem(
                                    // Ustawienie czcionki Open Sans
                                    textStyle: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(0, 0, 0, 0.612),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'Organizacja',
                                  style: GoogleFonts.rem(
                                    // Ustawienie czcionki Open Sans
                                    textStyle: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(0, 0, 0, 0.612),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    //
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              width: width * 0.5,
              height: height * 0.05,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(222, 58, 214, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Zapisz się ',
                    style: GoogleFonts.rem(
                      // Ustawienie czcionki Open Sans
                      textStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ),
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
            textStyle: const TextStyle(
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(0, 0, 0, 0.612),
                fontSize: 12,
                fontWeight: FontWeight.bold),
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
