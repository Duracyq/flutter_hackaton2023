import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: width * 0.05),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.05),
              width: width * 0.9,
              height: height * 0.5,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.8,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Logowanie Wolontariusza',
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(131, 116, 116, 100),
                          ),
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
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Hasło',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(131, 116, 116, 100),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 55),
                      backgroundColor: const Color.fromARGB(255, 140, 31, 134),
                    ),
                    onPressed: () {
                      // List<String> selected = [];
                      // for (int i = 0; i < languages.length; i++) {
                      //   if (selectedLanguages[i]) {
                      //     selected.add(languages[i]);
                      //   }
                      // }
                      //! POST REQUEST !!!!
                    },
                    child: const Text('Zaloguj się'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
