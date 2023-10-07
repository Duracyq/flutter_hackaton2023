import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            padding: EdgeInsets.only(top: width * 0.1),
            width: width * 0.9,
            height: height * 2,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 58, 214),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Imię',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Nazwisko',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Imię',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Adres',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Numer dowodu/legitymacji',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'PESEL',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: "Telefon",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Wiek',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 46, 199),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          // Ustawienie czcionki Open Sans
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        decoration: const InputDecoration(
                          hintText: 'J',
                          hintStyle: TextStyle(color: Colors.white),
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
                        style: TextStyle(fontSize: 20.0),
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
                        onPressed: () {
                          List<String> selected = [];
                          for (int i = 0; i < languages.length; i++) {
                            if (selectedLanguages[i]) {
                              selected.add(languages[i]);
                            }
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Wybrane języki:'),
                                content: Text(selected.join(', ')),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
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
