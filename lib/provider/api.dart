part of 'package:crackit/app.dart';

class API with ChangeNotifier {
  Map<String, dynamic> _successMap = {};
  Map<String, dynamic> _errorMap = {};
  bool _success = false;
  bool _error = false;
  bool _dataError = false;
  bool _catchError = false;
  bool _tokenExpired = true;
  bool _isLoading = false;
  bool _operationSuccess = false;
  bool _operationDone = false;
  bool _operationError = false;
  String _successMessage = '';
  String _errorMessage = '';
  String _actionMessage = '';

  Map<String, dynamic> get successMap => _successMap;
  Map<String, dynamic> get errorMap => _errorMap;
  bool get success => _success;
  bool get error => _error;
  bool get dataError => _dataError;
  bool get catchError => _catchError;
  bool get tokenExpired => _tokenExpired;
  bool get isLoading => _isLoading;
  bool get operationError => _operationError;
  bool get operationSuccess => _operationSuccess;
  bool get operationDone => _operationDone;
  String get successMessage => _successMessage;
  String get errorMessage => _errorMessage;
  String get actionMessage => _actionMessage;

  void _load() {
    _isLoading = true;
    notifyListeners();
  }

  void init() {
    _errorMap = {};
    _success = false;
    _catchError = false;
    _dataError = false;
    _successMessage = '';
    _successMap = {};
    _errorMessage = '';
    _tokenExpired = false;
    _actionMessage = '';
    _error = false;
    _isLoading = false;
    notifyListeners();
  }

  void operationInit() {
    _operationDone = false;
    _operationError = false;
    _operationSuccess = false;
    notifyListeners();
  }

  Future<void> auth(String url, Map body) async {
    _load();
    try {
      final response =
          await http.post(Uri.parse(Urls.commonBase + url), body: body);
      debugPrint(response.body);

      if (response.ok) {
        _success = true;
        await storage.write(
            key: 'token',
            value: jsonDecode(response.body)['dataPayload']['data']['token']);
      } else {
        _dataError = true;
        _errorMap = jsonDecode(response.body);
      }
    } catch (e) {
      _catch(e);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> get(String? url) async {
    String? token = await storage.read(key: 'token');
    debugPrint(Urls.commonBase+url!);
    _load();
    try {
      final response =
          await http.get(Uri.parse(Urls.commonBase + url!), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 15));

      debugPrint(response.body);

      if (response.ok) {
        _success = true;
        _successMap = jsonDecode(response.body);
      } else {
        _apiError(response);
      }
    } catch (e) {
      _catch(e);
    }
    _isLoading = false;
    notifyListeners();
  }

  void _apiError(http.Response response) {
    _error = true;
    if (response.statusCode == 401) {
      _tokenExpired = true;
      _errorMessage = 'Oops! your session has expired';
      _actionMessage = 'Logout';
    } else {
      _errorMessage = 'Oops! something went wrong, try again later';
      _catchError = true;
      _actionMessage = 'Retry';
    }
  }

  void _catch(Object e) {
    _error = true;
    _catchError = true;
    debugPrint(e.toString());
    if (e is SocketException || e is FormatException) {

      _errorMessage = 'Oops! Looks like there is a connection error.';
    } else if (e is TimeoutException) {
      _errorMessage = 'Oops! Timeout was reached.';
    } else {
      _errorMessage = e.toString();//'Oops! Something went wrong, try again later.';
    }
    _actionMessage = 'Retry';
  }

  void _operationCatchError(Object e) {
    _operationError = true;
    if (e is SocketException || e is FormatException) {
      _errorMessage = 'Oops! Connection error';
    } else {
      _errorMessage = 'Oops! Something went wrong';
    }
  }

  void _operationDataError(http.Response response) {
    _operationError = true;
    _errorMessage = 'Oops! Something went wrong';
  }

  void _operationDataSuccess(http.Response response) {
    _operationSuccess = true;
    _successMessage = jsonDecode(response.body)['toastPayload']['toastMessage'];
  }

  Future<void> delete(String url) async {
    _load();
    String? token = await storage.read(key: 'token');
    try {
      final response =
          await http.delete(Uri.parse(Urls.commonBase + url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 15));
      debugPrint(response.body);
      if (response.ok) {
        _operationDataSuccess(response);
      } else {
        _operationDataError(response);
      }
    } catch (e) {
      _operationCatchError(e);
    }
    _operationDone = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> status(String url, String body) async {
    debugPrint(url);
    _load();
    String? token = await storage.read(key: 'token');
    try {
      debugPrint(Urls.commonBase + url);
      final response = await http
          .patch(Uri.parse(Urls.commonBase + url), body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 15));
      debugPrint(response.body);
      if (response.ok) {
        _operationDataSuccess(response);
      } else {
        _operationDataError(response);
      }
    } catch (e) {
      debugPrint(e.toString());
      _operationCatchError(e);
    }
    _operationDone = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> restore(String url) async {
    _load();
    String? token = await storage.read(key: 'token');
    try {
      final response =
          await http.patch(Uri.parse(Urls.commonBase + url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 15));
      debugPrint(response.body);
      if (response.ok) {
        _operationDataSuccess(response);
      } else {
        _operationDataError(response);
      }
    } catch (e) {
      _operationCatchError(e);
    }
    _operationDone = true;
    _isLoading = false;
    notifyListeners();
  }

Future<dynamic> search(String url) async {
    String? token = await storage.read(key: 'token');
    try{
      return await http.get(Uri.parse(Urls.commonBase + url),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
    }catch(e){}
}
}
