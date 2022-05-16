part of 'package:crackit/app.dart';

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

enum MenuItem { item1, item2, item3 }
enum Operations {activate, restore, delete, deactivate, view, edit}