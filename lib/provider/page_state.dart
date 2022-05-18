part of 'package:crackit/app.dart';

class PageState extends ChangeNotifier{
  int perPageValue = 25;
  perPage(int value){
    perPageValue = value;
    notifyListeners();
  }
}