library events;

import 'package:event_bus/event_bus.dart';

// constants
//@observable const String DIE_IMAGE_PATH = "images/dice";

// event bus
EventBus eventBus = new EventBus();

// events
final EventType<String> outputMessageEvent = new EventType<String>();   // output window listens for these

// model
//Model model;