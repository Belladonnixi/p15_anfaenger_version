import 'package:flutter/material.dart';
import 'package:p15_anfaenger_version/data.dart';

// Version mit ListView.builder

class MainApp2 extends StatelessWidget {
  const MainApp2({super.key});

  @override
  Widget build(BuildContext context) {
    // // Eine Map, die die Kategorien und deren Listenelemente definiert. Damit kann man die Kategorien und Listenelemente in einer Liste anzeigen.
    // final List<MapEntry<String, ListItem?>> itemsList =
    //     itemsMap.entries.expand((entry) {
    //   // Temporäre Liste für Kategoriename und Listenelemente
    //   final List<MapEntry<String, ListItem?>> tempList = [];

    //   // 1. Füge den Kategorienamen hinzu (mit null als ListItem).
    //   // MapEntry.key ist der Kategoriename, MapEntry.value ist die Liste von ListItems.
    //   tempList.add(MapEntry(entry.key, null));

    //   // 2. Iteriere über alle Listenelemente und füge sie zur Liste hinzu.
    //   for (var item in entry.value) {
    //     tempList.add(MapEntry('', item));
    //   }

    //   // Gib die temporäre Liste zurück.
    //   return tempList;
    // }).toList(); // Konvertiere das Ergebnis in eine Liste.

    //Alternative Version mit Spread-Operator:
    //um die temporäre Liste zu erstellen und die Listenelemente hinzuzufügen.

    final List<MapEntry<String, ListItem?>> itemsList =
        itemsMap.entries.expand((entry) {
      // Für jede Kategorie (z. B. "Account", "Info") erstellen wir eine Liste.
      return [
        // 1. Füge einen MapEntry für den Kategorienamen hinzu.
        // Der Wert (ListItem) ist null, da dies nur ein Titel ist.
        MapEntry(entry.key, null),

        // 2. Füge alle Listenelemente dieser Kategorie hinzu.
        // Jedes Listenelement wird in einen MapEntry umgewandelt, wobei der Schlüssel ein leerer String ist.
        // ... ist der Spread-Operator, der die Liste von ListItems in eine Liste von MapEntries umwandelt.
        ...entry.value.map((item) => MapEntry('', item)),
      ];
    }).toList(); // Konvertiere das Ergebnis in eine Liste.

    // // itemsList sieht so aus danach:
    // [
    //     MapEntry('Account', null), // Kategoriename
    //     MapEntry('', ListItem(Icons.language, 'App-Sprache')), // Element 1
    //     MapEntry('', ListItem(Icons.block, 'Blockierte User')), // Element 2
    //     MapEntry('Info', null), // Kategoriename
    //     MapEntry('', ListItem(Icons.info, 'Datenschutzerklärung')), // Element 1
    //     MapEntry('', ListItem(Icons.gavel, 'AGB\'s')), // Element 2
    //     ...
    // ]

    return MaterialApp(
      // nimmt das debug Flag raus das man sonst sieht beim debuggen
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
            // Expanded sorgt dafür, dass der ListView den verfügbaren Platz einnimmt
            // ohne Expand würde das einen RenderFlex-Fehler verursachen (da Column nicht genügend Platz für ListView hat)
            Expanded(
              child: ListView.builder(
                // verhindert das die ListView scrollbar ist
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemsList.length, // Anzahl der Einträge
                itemBuilder: (context, index) {
                  final entry = itemsList[index];

                  // Wenn das ListItem null ist, handelt es sich um einen Kategorie-Titel
                  if (entry.value == null) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  // Ansonsten handelt es sich um ein value-ListItem
                  final item = entry.value!;
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('${item.title} tapped');
                    },
                  );
                },
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
