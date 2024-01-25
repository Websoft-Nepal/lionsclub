import 'package:flutter/material.dart';
import '../data/Models/news_events.dart';

class NewsEventsProvider extends ChangeNotifier {
  List<newsevents> _newsEvents = [];

  List<newsevents> get newsEvents => _newsEvents;

  void setNewsEvents(List<newsevents> newsEvents) {
    _newsEvents = newsEvents;
    notifyListeners();
  }
}
