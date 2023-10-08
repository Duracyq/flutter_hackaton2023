import 'package:flutter/material.dart';

Drawer buildDrawerConfig(BuildContext context){
    var deviceHeight = MediaQuery.of(context).size.height;
    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydarzenia",
      "Chat",
    ];

  return Drawer(
          child: ListView(
            children: [
              ...drawerTabs.map(
                (e) => ListTile(
                  title: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(deviceHeight / 25),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.info),
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
            ],
          ),
        );
}