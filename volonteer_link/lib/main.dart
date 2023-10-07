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
    List <String> eventName = [];
    List <String> event_text = [];
    List <String> event_date = [];


  // for(int i = 0; i < 2; i++){
  //   a[i] = 
  // }

    final List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
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
        drawer: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Drawer(
            child: ListView(
              children: drawerTabs.map((e) => Text(e, 
                  style: const TextStyle(
                    fontSize: 20,  
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
        body:Align(
            alignment: Alignment.topCenter,
            child: Column(
            children:[
              Row( 
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Wydażenia:',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Scrollbar(
                        child: ListView(
                          children: 
                              eventName.map((e) => Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(e, 
                                    style: const TextStyle(
                                      fontSize: 20,  
                                    ),
                                  ),
                              ),).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(),
             ],
            ),
          ),
        );
  
  }
}
