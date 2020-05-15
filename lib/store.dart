import 'package:app/constants.dart';
import 'package:app/events.dart';
import 'package:app/filters.dart';
import 'package:app/months.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Store with ChangeNotifier {
  //? STATE START
  bool _active = true;
  List<Map> _events = acara;
  List<Map> _filters = filterList;
  //! STATE END

  //? ACTIONS START
  void toggle(bool value) {
    _active = value;
    notifyListeners();
  }

  void filter(String key) {
    print("filtering...");
    notifyListeners();
  }

  void toggleCheckbox(Map filter) {
    int index = _filters.indexOf(filter);
    for (var i = 0; i < _filters.length; i++) {
      if (i == index) {
        _filters[i]["active"] = true;
      } else {
        _filters[i]["active"] = false;
      }
    }
    notifyListeners();
  }
  //! ACTIONS END

  //? GETTERS START
  bool get active => _active;
  List<Map> get events => _events;
  List<Map> get filters => _filters;
  //! GETTERS END

  //? COMPUTED START
  Map getStatus(dynamic status) {
    Map result = new Map();
    if (status == "pending") {
      result["text"] = "Konfirmasi Kedatangan";
      result["color"] = white;
      result["backgroundColor"] = blue;
      result["disabled"] = false;
    } else if (!status) {
      result["text"] = "Tidak Dapat Hadir";
      result["color"] = red;
      result["backgroundColor"] = transparent;
      result["disabled"] = true;
    } else {
      result["text"] = "Mungkin Hadir";
      result["color"] = orange;
      result["backgroundColor"] = transparent;
      result["disabled"] = true;
    }
    return result;
  }

  String getDate(String date) {
    List<int> formattedDate =
        date.split("/").map((str) => int.parse(str)).toList();
    String newDate = formattedDate[0].toString();
    String month = months[formattedDate[1] - 1];
    return newDate + " " + month;
  }

  String getActiveFilter() {
    String text;
    for (var i = 0; i < _filters.length; i++) {
      if (_filters[i]["active"] == true) {
        text = _filters[i]["text"];
      }
    }
    if (text == null) {
      text = _filters[0]["text"];
      _filters[0]["active"] = true;
    }
    return text;
  }

  Color getBorderColor(Color color) {
    if (color == transparent) {
      return divider_color;
    }
    return transparent;
  }
  //! COMPUTED END
}
