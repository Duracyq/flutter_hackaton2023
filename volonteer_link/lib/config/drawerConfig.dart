import 'package:flutter/material.dart';
import '../main.dart' as m;
import '../event.dart' as ev;
// import '../'; uzytkownicy

Drawer buildDrawerConfig(BuildContext context) {
  var deviceHeight = MediaQuery.of(context).size.height;
  final List<String> drawerTabs = [
    "Start",
    "Wydarzenia",
    "Użytkownicy",
    "Chat",
    "Kontakt",
  ];
  final List<IconData?> drawerIcons = [
    Icons.home, // Placeholder for the first item with no icon
    Icons.event,
    Icons.person,
    Icons.chat_bubble,
    Icons.phone,
  ];
  Future<Object?> nav(Widget place) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => place),
    );
  }

  return Drawer(
    child: ListView(
      children: [
        ...drawerTabs.asMap().entries.map(
              (entry) => GestureDetector(
                onTap: () {
                  // Handle onTap for each item here
                  switch (entry.key) {
                    case 0:
                      // Handle "Start" item click
                      nav(m.MyApp());
                      break;
                    case 1:
                      // Handle "Wydarzenia" item click
                      nav(ev.Events());
                      break;
                    case 2:
                      // Handle "Użytkownicy" item click
                      // nav();
                      break;
                    case 3:
                      // Handle "Chat" item click
                      // nav();
                      break;
                    case 4:
                      // Handle "Kontakt" item click
                      // nav();
                      break;
                  }
                },
                child: ListTile(
                  leading: Icon(drawerIcons[entry.key],
                      size: 40), // Use leading for the icon
                  title: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(deviceHeight / 25),
                ),
              ),
            ),
        GestureDetector(
          onTap: () {
            // Handle "Copyright 2023" item click
          },
          child: ListTile(
            leading: const Icon(Icons.info),
            title: Row(
              children: [
                const SizedBox(width: 8), // Add some spacing
                Text(
                  'Copyright 2023',
                  style: TextStyle(
                    fontSize: 14, // Adjust the font size as needed
                    color: Colors.grey, // Customize the color
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
