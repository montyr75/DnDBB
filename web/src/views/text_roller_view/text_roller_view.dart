library text_roller_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/roller.dart';
import '../../model/events.dart' as events;

@CustomTag('text-roller-view')
class TextRollerView extends PolymerElement {

  @observable String textRoll = "";

  TextRollerView.created() : super.created();

  void enteredView() {
    super.enteredView();
    print("TextRollerView()::enteredView()");
  }

  void roll(Event e, var detail, Element target) {
    events.eventBus.fire(events.outputMessageEvent, Roller.rollFromString(textRoll));
  }

  void clear() {
    textRoll = "";
  }

  void submit(Event e, var detail, Element target) {
    e.preventDefault();
  }
}