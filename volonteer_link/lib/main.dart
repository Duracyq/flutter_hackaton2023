import 'package:flutter/material.dart';
import 'rejestracja.dart';
import 'user_profil.dart';
import 'productModel.dart';
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

    List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydaenia",
      "Chat",
    ];

     double deviceHeight = MediaQuery.of(context).size.height;

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
          body: const Align(
            alignment: Alignment.topCenter,
            child: Column(
            children:[
              Row( 
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Wydarzenia:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Scrollbar(
                        child: Text('x'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Chaty:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Scrollbar(
                        child: Text('x'),
                      ),
                    ],
                  ),
                ],
              ),
             ],
            ),
          ),
        );
  
  }
}
