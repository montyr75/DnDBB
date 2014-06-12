library output_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/events.dart' as events;
import 'dart:async';

@CustomTag('output-view')
class OutputView extends PolymerElement {

  @observable List<String> messages = toObservable([]);

  StreamSubscription<String> outputMessageEventSub;    // <String> because the events pass string arguments

  OutputView.created() : super.created();

  @override void attached() {
    super.attached();
    print("OutputView::attached()");

    // listen for outputMessageEvents
    outputMessageEventSub = events.eventBus.on(events.outputMessageEvent).listen(addMsg);
  }

  void leftView() {
    super.leftView();
    print("OutputView::leftView()");

    // cancel subscription to rollEvents
    outputMessageEventSub.cancel();
  }

  void clear(Event e, var detail, Element target) {
    messages.clear();
  }

  void addMsg(String msg) {
    messages.add(msg);
  }
  
  // TODO: requiring this seems to be a Polymer bug -- exception thrown without it
  void set msg(value) {}
}