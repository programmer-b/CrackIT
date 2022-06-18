part of 'package:crackit/UI/Home/Apps/apps.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: Text('JOBS'),
      ),
      body: Center(
        child: Text('Jobs'),
      ),
    );
  }
}