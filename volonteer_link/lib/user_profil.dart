import 'package:flutter/material.dart';
import 'config/appbarConfig.dart';
import 'config/drawerConfig.dart';
import './login.dart'; // Import the login page file

class UserProfil extends StatefulWidget {
  const UserProfil({super.key});

  @override
  State <UserProfil> createState() => UserProfilState();
}

class UserProfilState extends State<UserProfil> {

    String userName = "testName";
    String userSecondName = "testSecondName";
    bool isLoggedIn = false;

    // implement navigating to register account or login path: ./login.dart/
    // if isLoggedIn == false
  


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: buildAppBar(context, null),
    drawer: buildDrawerConfig(context),
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
              // Your content for the user profile
            ),
          ],
        ),
        // Conditional navigation based on isLoggedIn
        if (!isLoggedIn)
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Login'),
          ),
      ],
    ),
  );
}
}