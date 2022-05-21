part of 'package:crackit/app.dart';

class SetupProvider with ChangeNotifier {
  String _url = '';
  String _title = '';
  String _name = '';
  String _postUrl = '';

  String _action = '';

  bool _edit = false;
  bool _view = false;
  bool _add = false;

  String get url => _url;
  String get title => _title;
  String get name => _name;
  String get postUrl => _postUrl;

  String get action => _action;

  bool get edit => _edit;
  bool get view => _view;
  bool get add => _add;

  void init(){
    _edit = false;
    _view = false;
    _add = false;
  }

  void editState(){
    init();
    _action = 'Edit';
    _edit = true;
    notifyListeners();
  }

  void viewState(){
    init();
    _action = 'View';
    _view = true;
    notifyListeners();
  }

  void addState(){
    init();
    _action = 'Add';
    _add = true;
    notifyListeners();
  }


  void currentPageUp({
    required String url,
    required String name,
    required String title,
    required String postUrl
  }) {
    _url = url;
    _title = title;
    _name = name;
    _postUrl = postUrl;
    notifyListeners();
  }
}
