import 'package:flutter/material.dart';
import 'user_profil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Rejestracja extends StatefulWidget {
  const Rejestracja({super.key});

  @override
  State<Rejestracja> createState() => _RejestracjaState();
}

class _RejestracjaState extends State<Rejestracja> {
  var productName;
  var productController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      productName = productController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydaenia",
      "Chat",
    ];

    double deviceHeight = MediaQuery.of(context).size.height;

    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const Color.fromARGB(156, 196, 15, 227),
          toolbarHeight: deviceHeight/6-20,
          title: const SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children:[
                          Text('Volonteerly', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            ),
                          ),
                          Text('Twój Wolontariat w zasięgu ręki', 
                            style: TextStyle(
                              color: Color.fromRGBO(255,255,255,80),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    )
                    
                  ],
                ),
              ],
            ),
          ), 
          actions: <Widget> [
            Padding( 
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: IconButton(
                onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const UserProfil()),
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView( 
              children: drawerTabs.map((e) => ListTile(
                title: Text(e, style:
                  const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: (){},
              ),).toList(), 
            ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 0.85 * height,
              width: width - 15,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 108, 239),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 0.15 * width,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 98, 216),
                        borderRadius:
                            BorderRadius.circular(10), // Zaokrąglenie rogów
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: width / 2,
                        height: height * 0.1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Imię',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white), // Kolor czcionki
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie normalnym
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie aktywnym
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.15 * width,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 98, 216),
                        borderRadius:
                            BorderRadius.circular(10), // Zaokrąglenie rogów
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: width / 2,
                        height: height * 0.1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Nazwisko',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white), // Kolor czcionki
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie normalnym
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie aktywnym
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.15 * width,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 98, 216),
                        borderRadius:
                            BorderRadius.circular(10), // Zaokrąglenie rogów
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: width / 2,
                        height: height * 0.1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Adres',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white), // Kolor czcionki
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie normalnym
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie aktywnym
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.15 * width,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 98, 216),
                        borderRadius:
                            BorderRadius.circular(10), // Zaokrąglenie rogów
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: width / 2,
                        height: height * 0.1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Numer dowodu/legitymacji szkolnej',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white), // Kolor czcionki
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie normalnym
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie aktywnym
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 0.15 * width,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 98, 216),
                        borderRadius:
                            BorderRadius.circular(10), // Zaokrąglenie rogów
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: width / 2,
                        height: height * 0.1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'PESEL',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.white), // Kolor czcionki
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie normalnym
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .purple), // Kolor obramowania w stanie aktywnym
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextContainer(
                      width: width * 0.5,
                      height: 0.15 * width,
                      text: 'Tel',
                      controller: productController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final TextEditingController controller;

  TextContainer({
    required this.width,
    required this.height,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 98, 216),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(20),
      child: Container(
        width: width / 2,
        height: height * 0.1,
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: GoogleFonts.openSans(
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
