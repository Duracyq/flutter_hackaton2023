import 'package:flutter/material.dart';
import 'rejestracja.dart';
import 'user_profil.dart';
void main() {
  runApp(const MaterialApp(
      home: MyApp()
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];
    //double dHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(156, 196, 15, 227),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              //Image.asset('assets/images/logo.png',
              Column(
                children: [
                  Center(
                    child: Column(
                      children:[
                        Text('Volonteerly', 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          ),
                        ),
                        Text('Twój Wolontariat w zasięgu ręki', 
                          style: TextStyle(
                            color: Color.fromRGBO(255,255,255,80),
                            fontSize: 12,
                            
                          ),
                      ),
                      ],
                    )
                  )
                  
                ],
              ),
            ],
          ), 
          actions: <Widget> [
            IconButton(
              onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserProfil()),
                );
              }, //dodać funkcję 
              icon: const Icon(Icons.person)
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: drawerTabs.map((e) => Text(e, 
                style: const TextStyle(
                  fontSize: 20,  
                ),
              ),
            ).toList(),
          ),
        ),
        body: const Column(
          children:[
            Row(
              children: [
                Column(
                  children: [
                    
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ),
      );
  }
}
