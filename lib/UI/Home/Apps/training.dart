part of 'package:crackit/UI/Home/Apps/apps.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: const Text('Training'),
      ),
      drawer: ComplexDrawer(
        menu: map[currentApp],
      ),
      body: const Center(
        child: Text('Training'),
      ),
    );
  }
}
