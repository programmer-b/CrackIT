part of 'package:crackit/UI/Home/Apps/apps.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(
        context,
        title: Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
    
  }
}