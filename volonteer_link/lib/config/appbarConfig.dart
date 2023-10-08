import 'package:flutter/material.dart';
import '../user_profil.dart';


AppBar buildAppBar(BuildContext context, List<String>? drawerTabs) {
  double deviceHeight = MediaQuery.of(context).size.height;

  return AppBar(
    backgroundColor: const Color.fromARGB(156, 196, 15, 227),
    toolbarHeight: deviceHeight / 6 - 20,
    title: const SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Row(children: [
                      Icon(Icons.volunteer_activism_outlined, size: 35),
                      Text(
                        ' Volonteerly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                      ],),
                    Text(
                      'Twój Wolontariat w zasięgu ręki',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 80),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UserProfil()),
            );
          },
          icon: const Icon(Icons.person),
        ),
      ),
    ],
  );
}
