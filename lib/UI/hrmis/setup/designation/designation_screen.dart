part of 'package:crackit/app.dart';

class DesignationScreen extends StatefulWidget {
  const DesignationScreen({Key? key}) : super(key: key);

  @override
  State<DesignationScreen> createState() => _DesignationScreenState();
}

class _DesignationScreenState extends State<DesignationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Txt(
              text: 'Designation',
              color: Colors.white,
            ),
          ),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
