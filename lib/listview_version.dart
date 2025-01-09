// Die Haupt-App-Klasse, die das Grundgerüst der App bereitstellt.
import 'package:flutter/material.dart';
import 'package:p15_anfaenger_version/main.dart';

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
            // ohne Expand würde das einen RenderFlex-Fehler verursachen (da Column nicht genügend Platz für ListView hat)
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
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            // Der Kategorienname wird als Titel angezeigt.
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Die Listenelemente innerhalb einer Kategorie.
                        Column(
                          // mit entry.value.map werden die ListItems in ListTiles umgewandelt.
                          children: entry.value.map((item) {
                            return ListTile(
                              // contentPadding sorgt für zusätzlichen Abstand.
                              // im Standard hat ListTile ein Padding an start von 16 Pixeln
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 24),
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
