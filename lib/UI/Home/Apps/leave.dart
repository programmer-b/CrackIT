part of 'package:crackit/UI/Home/Apps/apps.dart';

class Leave extends StatefulWidget {
  const Leave({Key? key}) : super(key: key);

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: Text('Leave'),
      ),
      body: const Center(
        child: Text('Leave'),
      ),
    );
    
  }
}