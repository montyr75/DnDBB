library main_view;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  static const String DICE_VIEW = "DICE_VIEW";
  static const String MONSTERS_VIEW = "MONSTERS_VIEW";

  @observable String currentView = DICE_VIEW;

  final List<int> rollers = const [
    4,
    6,
    8,
    10,
    12,
    20,
    100
  ];

  MainView.created() : super.created();

  @override void attached() {
    super.attached();
    print("MainView::attached()");
  }

  void changeView(Event e, var detail, Element target) {
    currentView = target.attributes['data-view'];
  }
}

