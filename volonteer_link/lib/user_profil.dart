import 'package:flutter/material.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({super.key});

  @override
  State <UserProfil> createState() => UserProfilState();
}

class UserProfilState extends State<UserProfil> {
  @override
  Widget build(BuildContext context) {

    final List <String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];
    
    String userName = "testName";
    String userSecondName = "testSecondName";


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
            Column(
              children: [
                Container(
                  
                ),
              ]
            ),
          ],
        ),
      );
  }
}

