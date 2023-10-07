import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Rejestracja extends StatefulWidget {
  const Rejestracja({super.key});

  @override
  State<Rejestracja> createState() => _RejestracjaState();
}

class _RejestracjaState extends State<Rejestracja> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    // double height = size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 0.25 * width,
            width: width - 15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(100, 222, 58, 214),
            ),
            child: Container(
              height: 0.25 * width * 0.5,
              width: width,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Imię',
                      hintStyle: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.grey), // Kolor czcionki
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .orange), // Kolor obramowania w stanie normalnym
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
            ),
          ),
        ),
      ),
    );
  }
}
