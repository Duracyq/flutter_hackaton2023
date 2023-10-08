// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

Drawer buildDrawerConfig(BuildContext context){
    var deviceHeight = MediaQuery.of(context).size.height;
    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydarzenia",
      "Użytkownicy",
      "Chat",
    ];
    final List<IconData?> drawerIcons = [
        null, // Placeholder for the first item with no icon
        Icons.phone,
        Icons.event,
        Icons.person,
        Icons.chat_bubble
      ];

  return Drawer(
  child: ListView(
    children: [
      ...drawerTabs.asMap().entries.map(
        (entry) => ListTile(
          leading: Icon(drawerIcons[entry.key]), // Use leading for the icon
          title: Text(
            entry.value,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          contentPadding: EdgeInsets.all(deviceHeight / 25),
        ),
      ),
      ListTile(
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
    ],
  ),
);
}