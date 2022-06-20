part of 'package:crackit/UI/Home/Apps/apps.dart';

class Employment extends StatefulWidget {
  const Employment({Key? key}) : super(key: key);

  @override
  State<Employment> createState() => _EmploymentState();
}

class _EmploymentState extends State<Employment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: const Text('Employment'),
      ),
      drawer: ComplexDrawer(
        menu: map[currentApp],
      ),
      body: const Center(
        child: Text('Employment'),
      ),
    );
  }
}
