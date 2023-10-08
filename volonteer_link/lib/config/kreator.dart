import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volonteer_link/config/appbarConfig.dart';
import 'package:volonteer_link/config/drawerConfig.dart';

void main() {
  runApp(MaterialApp(
    home: Tworzenie(),
  ));
}

class Tworzenie extends StatefulWidget {
  const Tworzenie({Key? key});
  @override
  State<Tworzenie> createState() => _TworzenieState();
}

class _TworzenieState extends State<Tworzenie> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController place = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController cVolo = TextEditingController();
  final TextEditingController minAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(context, null),
        drawer: buildDrawerConfig(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: width * 0.05),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: width * 0.05, bottom: width * 0.05),
                      width: width * 0.9,
                      height: height * 0.7,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 177, 251),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.8,
                            height: 60,
                            child: Center(
                              child: Text(
                                'Tworzenie wydarzenia',
                                style: GoogleFonts.mooli(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromARGB(255, 55, 0, 61),
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Nazwa Akcji',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: desc,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Opis akcji',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: place,
                                onTap: () => const OutlineInputBorder(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Adres',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: date,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Data',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: cVolo,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Ile potrzeba wolontariuszy?',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 237, 237),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: minAge,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(131, 116, 116, 100),
                                    fontSize: 20,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Minimalny wiek wolontariuszy',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(131, 116, 116, 100)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 140, 31, 134),
                          borderRadius: BorderRadius.circular(15)),
                      height: height * 0.1,
                      width: width * 0.5,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Utwórz',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
