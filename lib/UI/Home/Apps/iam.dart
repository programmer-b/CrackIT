part of 'package:crackit/UI/Home/Apps/apps.dart';

class IAM extends StatefulWidget {
  const IAM({Key? key}) : super(key: key);

  @override
  State<IAM> createState() => _IAMState();
}

class _IAMState extends State<IAM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: const Text('IAM'),
      ),
      drawer: ComplexDrawer(
        menu: map[currentApp],
      ),
      body: const Center(
        child: Text('IAM'),
      ),
    );
  }
}