import 'package:flutter/material.dart';
import 'package:p15_anfaenger_version/listview_builder_version.dart'; // diese Zeile auskommentieren um die ListView.builder Version zu verwenden

// Die Hauptfunktion, die die App startet.
void main() {
  // MainApp2 ist die Klasse, die die ListView.builder Version enthält hier also ändern auf MainApp2
  runApp(const MainApp2());
}

// Eine Modelklasse, die ein Listenelement definiert.
// Diese Klasse speichert ein Symbol (Icon) und einen Titel (Text).
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
