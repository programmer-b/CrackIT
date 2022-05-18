part of 'package:crackit/app.dart';

class PageState extends ChangeNotifier {
  int perPageValue = 25;
  perPage(int value) {
    perPageValue = value;
    notifyListeners();
  }

  String currentUrl = '';
  url(String url) {
    currentUrl = url;
    notifyListeners();
  }

  String currentPage = '1';
  page(String page) {
    currentPage = page;
    notifyListeners();
  }
}
