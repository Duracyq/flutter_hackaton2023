import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_profil.dart';

class Rejestracja01 extends StatefulWidget {
  const Rejestracja01({super.key});

  @override
  State<Rejestracja01> createState() => _Rejestracja01State();
}

class _Rejestracja01State extends State<Rejestracja01> {
  @override
  Widget build(BuildContext context) {
    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(156, 196, 15, 227),
        toolbarHeight: deviceHeight / 6 - 20,
        title: const SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        'Volonteerly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                        ),
                      ),
                      Text(
                        'Twój Wolontariat w zasięgu ręki',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 80),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const UserProfil()),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Drawer(
          child: ListView(
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
        ),
      ),
      body: const Rejestracja(),
    );
  }
}

class Rejestracja extends StatefulWidget {
  const Rejestracja({super.key});
  @override
  State<Rejestracja> createState() => _RejestracjaState();
}

class _RejestracjaState extends State<Rejestracja> {
  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      'Angielski',
      'Hiszpański',
      'Francuski',
      'Niemiecki',
      'Portugalski',
      'Rosyjski',
      'Ukraiński',
      // Dodaj inne języki według potrzeb
    ];
    List<bool> selectedLanguages = List.generate(7, (index) => false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: width * 0.05),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.05),
            width: width * 0.9,
            height: height * 1.5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 177, 251),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.8,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Rejestracja Wolontariusza',
                        style: GoogleFonts.mooli(
                          // Ustawienie czcionki Open Sans
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
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Imię',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Nazwisko',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        onTap: () => const OutlineInputBorder(),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Hasło',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Adres',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Numer dowodu/legitymacji',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'PESEL',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: "Telefon",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
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
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(131, 116, 116, 100),
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Wiek',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(131, 116, 116, 100)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      const Text(
                        'Jakie języki obce znasz?',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: List.generate(languages.length, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedLanguages[index] =
                                    !selectedLanguages[index];
                              });
                            },
                            child: CheckboxListTile(
                              title: Text(languages[index]),
                              value: selectedLanguages[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedLanguages[index] = value!;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 55),
                          backgroundColor:
                              const Color.fromARGB(255, 140, 31, 134),
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
                        child: const Text('Zapisz'),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
