part of 'package:crackit/UI/Home/Apps/apps.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: Text('Auth'),
      ),
      body: const Center(
        child: Text('Auth'),
      ),
    );
  }
}
