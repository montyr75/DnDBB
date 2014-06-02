library model;

import 'dart:html';
import 'dart:async';
import 'dart:convert';

class Model {

  static Model model;

  // model data
  List monsters = [];

  static List dataSources = [
    /*{"modelProperty": "creatureSizes", "path": "../../creature_sizes.json"},
    {"modelProperty": "creatureTypes", "path": "../../creature_types.json"},
    {"modelProperty": "damageTypes", "path": "../..//damage_types.json"},
    {"modelProperty": "monsters", "path": "../../data/monsters.json", "class": "Monster"}*/
  ];

  factory Model() {
    print("Model()");

    // allow only one instance
    if (model == null) {
      model = new Model._internal();
    }

    return model;
  }

  Model._internal() {
    List<Future> futures = [];

    // load all data
    dataSources.forEach((dataSource) {
      futures.add(HttpRequest.getString(dataSource['path']));
    });

    Future.wait(futures).then((List values) {
      print(JSON.decode(values[0]));
    });
  }
}
