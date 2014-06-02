library unsafe_html_display;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('unsafe-html-display')
class UnsafeHtmlDisplay extends PolymerElement {
  @published String content;

  // non-visual initialization can be done here
  UnsafeHtmlDisplay.created() : super.created();

  @override void enteredView() {
    super.enteredView();
  }

  // respond to any change in the "content" attribute
  void contentChanged(oldValue) {
    if (content == null) {
      content = "";
    }

    // creating a DocumentFragment allows for HTML parsing
    $['content-container'].nodes..clear()..add(new DocumentFragment.html("$content"));
  }
}
