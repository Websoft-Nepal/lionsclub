import 'package:flutter/material.dart';
import '../data/Models/program.dart';

class ProgramProvider extends ChangeNotifier {
  List<program> _programs = [];

  List<program> get programs => _programs;

  void setPrograms(List<program> programs) {
    _programs = programs;
    notifyListeners();
  }
}
