// Eine Modelklasse, die ein Listenelement definiert.
// Diese Klasse speichert ein Symbol (Icon) und einen Titel (Text).
import 'package:flutter/material.dart';

class ListItem {
  ListItem(this.icon, this.title);

  final IconData icon;
  final String title;
}

// Eine Map, die die Kategorien und deren Listenelemente definiert.
// Jede Kategorie (z. B. "Account", "Info") hat eine Liste von ListItems.
final Map<String, List<ListItem>> itemsMap = {
  'Account': [
    ListItem(Icons.language, 'App-Sprache'),
    ListItem(Icons.block, 'Blockierte User'),
  ],
  'Info': [
    ListItem(Icons.info, 'Datenschutzerklärung'),
    ListItem(Icons.gavel, 'AGB\'s'),
    ListItem(Icons.article, 'Lizenzen'),
    ListItem(Icons.group, 'Community Richtlinien'),
  ],
};
