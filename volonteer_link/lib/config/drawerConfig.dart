import 'package:flutter/material.dart';

Padding buildDrawerConfig(BuildContext context){

    final List<String> drawerTabs = [
      "O nas",
      "Informacja kontaktowa",
      "Wydażenia",
      "Chat",
    ];

  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
    child: Drawer(
      child: ListView(
        children: drawerTabs
            .map(
              (e) => Text(
                e,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
            .toList(),
      ),
    ),
  );      //
}