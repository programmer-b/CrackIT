part of 'package:crackit/UI/Home/Apps/apps.dart';

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: const Text('Setup'),
      ),
      drawer: ComplexDrawer(
        menu: map[currentApp],
      ),
      body: const Center(
        child: Text('Setup'),
      ),
    );
  }
}