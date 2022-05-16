part of 'package:crackit/app.dart';

class EmploymentScreen extends StatefulWidget {
  const EmploymentScreen({Key? key}) : super(key: key);

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Txt(
              text: 'Employment',
              color: Colors.white,
            ),
          ),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
