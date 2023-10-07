import 'package:flutter/material.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({super.key});

  @override
  State <UserProfil> createState() => UserProfilState();
}

class UserProfilState extends State<UserProfil> {
    final List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];

    String userName = "testName";
    String userSecondName = "testSecondName";

  @override
  Widget build(BuildContext context) {
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
              onPressed: (){}, //dodać funkcję 
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
        body: Column(
          children: [
            Column( // dane użytkownika
              children: [
                Row(
                  children: [
                    // Image(
                    //   image:,
                    // ),
                    Text(userName), 
                    const SizedBox(
                      width: 5,
                    ),
                    Text(userSecondName),
                  ],
                ),
              ],
            ),
            const Column(),
          ],
        ),
      );
  }
}

