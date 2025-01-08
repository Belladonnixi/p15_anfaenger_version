import 'package:flutter/material.dart';

// Die Hauptfunktion, die die App startet.
void main() {
  runApp(const MainApp());
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
    ListItem(Icons.gavel, "AGB's"),
    ListItem(Icons.article, 'Lizenzen'),
    ListItem(Icons.group, 'Community Richtlinien'),
  ],
};

// Die Haupt-App-Klasse, die das Grundgerüst der App bereitstellt.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Die obere AppBar mit einem Titel und einer Trennlinie.
        appBar: AppBar(
          title: const Text(
            'Einstellungen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ),
        ),
        // Der Hauptinhalt der Seite.
        body: Column(
          children: [
            // Expanded sorgt dafür, dass die ListView den gesamten verfügbaren Platz einnimmt.
            Expanded(
              child: ListView(
                // Die Map (itemsMap) wird in eine Liste von Widgets umgewandelt.
                children: itemsMap.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategorie-Titel (z. B. "Account" oder "Info").
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Die Listenelemente innerhalb einer Kategorie.
                        Column(
                          children: entry.value.map((item) {
                            return ListTile(
                              leading:
                                  Icon(item.icon), // Icon des Listenelements
                              title:
                                  Text(item.title), // Titel des Listenelements
                              trailing: const Icon(
                                Icons.chevron_right,
                              ),
                              onTap: () {
                                // Einfache Aktion beim Antippen des Listenelements.
                                print('${item.title} tapped');
                              },
                            );
                          }).toList(), // Die ListItems werden in ListTiles umgewandelt.
                        ),
                      ],
                    ),
                  );
                }).toList(), // Die Map wird in eine Liste von Widgets konvertiert.
              ),
            ),
            // Bereich am unteren Rand der Seite mit Buttons.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // Minimiert die Größe der Spalte basierend auf dem Inhalt.
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Button zum "Ausloggen".
                  TextButton(
                    onPressed: () => print('Ausloggen tapped'),
                    child: const Text(
                      'Ausloggen',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Button zum "Account löschen".
                  TextButton(
                    onPressed: () => print('Account löschen tapped'),
                    child: const Text(
                      'Account löschen',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
