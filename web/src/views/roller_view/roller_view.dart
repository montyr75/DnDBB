library roller_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/filter.dart';
import '../../model/roller.dart';
import '../../model/events.dart' as events;
import '../../utils/filters.dart';

@CustomTag('roller-view')
class RollerView extends PolymerElement {
  static const String DIE_IMAGE_PATH = "resources/images/dice/red";

  @published int sides;

  // UI bindings
  int qty;
  int mod;
  int rep = 1;       // how many times should the formula be rolled?

  @observable String dieImgPath;

  // filters and transformers can be referenced as fields
  final Transformer asInteger = new StringToInt();

  RollerView.created() : super.created();

  void enteredView() {
    super.enteredView();
    //print("RollerView::enteredView()");

    // roller is not properly filled until this point (at DOM insertion)
    dieImgPath = "${DIE_IMAGE_PATH}/d${sides}.png";

    clear();
  }

  void roll([Event event, var detail, Element target]) {
    qty = qty == null || qty < 1 ? 1 : qty;
    sides = sides == null || sides < 2 ? 2 : sides;
    mod = mod == null ? 0 : mod;
    rep = rep == null || rep < 1 ? 1 : rep;

    for (int i = 0; i < rep; i++) {
      events.eventBus.fire(events.outputMessageEvent, Roller.roll(qty, sides, mod));
    }
  }

  void clear() {
    qty = null;
    mod = null;
    rep = 1;
  }

  void keyUp(KeyboardEvent event, var detail, Element target) {
    if (event.keyCode == KeyCode.ENTER) {
      roll();
    }
  }

  void submit(Event event, var detail, Element target) {
    event.preventDefault();
  }
}