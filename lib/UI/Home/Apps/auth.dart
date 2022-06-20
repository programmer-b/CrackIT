part of 'package:crackit/UI/Home/Apps/apps.dart';

class Auth extends StatefulWidget {
  const Auth({
    Key? key,
  }) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var menus = map;
  
  @override
  Widget build(BuildContext context) {
    debugPrint(currentApp.toString());
    return Scaffold(
      appBar: _appbar(
        context,
        title: const Text('Auth'),
      ),
      drawer: ComplexDrawer(
        menu: map[currentApp],
      ),
      body: const Center(
        child: Text('Auth'),
      ),
    );
  }
}
