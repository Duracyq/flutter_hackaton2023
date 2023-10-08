import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'productModel.dart' as productModel;


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

  late List<productModel.Event> events;

    List <String> eventName = [];
    List <String> evenText = [];
    List <String> eventDate = [];
    late List<productModel.Event> eventsList = [];


  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    events = jsonList.map((json) => productModel.Event.fromJson(json)).toList();
  }

  static List drawerTabs = [
    "O nas",
    "Kontakt",
    "Wydarzenia",
    "Chat",
  ];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    //double dHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
              onPressed: (){}, //dodać funkcję 
              icon: const Icon(Icons.person)
            ),
          ],
          
          //backgroundColor:Color.fromARGB(193, 71, 212),
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //         onPressed: (){}, //dodać funkcję 
          //         icon: const Icon(Icons.view_headline), //dodać icon trzech kresek
          //         //color:, 
          //     ),
          //     SizedBox(
          //       height: dHeight/6,
          //       child: Align(
          //         child: const Row(
          //           children:[
          //           Column(
          //             children:[
          //               Text('Volonteerly', style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 24,
          //                 ),
          //               ),
          //               Text('Twój Wolontariat w zasięgu ręki', style: TextStyle(
          //                 color:Color.fromRGBO(255, 255, 255, 1),
          //                 fontSize: 16,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //       ),
          //     ),
          //     IconButton(
          //         onPressed: (){}, //dodać funkcję 
          //         icon: const Icon(Icons.person), 
          //         color: Colors.white, 
          //     ),
          //   ],
          // ),
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
                        child: Text('Wydarzenia:',
                          style: TextStyle(
                            fontSize: 25,
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
        // drawer: Drawer(),
        // body: const Text('body'),
      ),
    )));
  }
}

