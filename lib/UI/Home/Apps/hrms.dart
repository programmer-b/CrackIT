part of 'package:crackit/UI/Home/Apps/apps.dart';

class HRMS extends StatefulWidget {
  const HRMS({Key? key}) : super(key: key);

  @override
  State<HRMS> createState() => _HRMSState();
}

class _HRMSState extends State<HRMS> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: _appbar(
          context,
          title: Text('HRMS'),
        ),
        body: const Center(
          child: Text('HRMS'),
        ),
      ),
    );
  }
}
