import 'package:flutter/material.dart';
import 'data.dart'; // Importiere die Datei mit itemsMap

// zu der Version würde ich für diesen Zweck sogar viel eher tendieren ohne die ListView

class MainApp3 extends StatelessWidget {
  const MainApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Column(
          children: [
            // Bereich mit den Kategorien und Listenelementen
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // hier iteriere ich über die Map mit dem Spread Operator an Stelle gehe ich durch die Map und erstelle dann eine Liste von Widgets
                  // so kann ich erst den Kategorienamen anzeigen und dann die dazugehörigen Listenelemente ausgeben lassen in einem ListTile
                  for (var entry in itemsMap.entries) ...[
                    // Kategoriename
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Listenelemente der Kategorie
                    for (var item in entry.value)
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        leading: Icon(item.icon),
                        title: Text(item.title),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          print('${item.title} tapped');
                        },
                      ),
                  ],
                ],
              ),
            ),
            // Bereich am unteren Rand der Seite mit Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
