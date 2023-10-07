import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(const MaterialApp(
      home: MyApp()
    ));
}

class Event {
  final int id;
  final String title;
  final String desc;
  final String organizator;

  Event({
    required this.id,
    required this.title,
    required this.desc,
    required this.organizator,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      organizator: json['organizator'],
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Event> events;

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    events = jsonList.map((json) => Event.fromJson(json)).toList();
  }

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
        drawer: Drawer(
            ),
        body: const Text('body'),
      ),
    );
  }
}

