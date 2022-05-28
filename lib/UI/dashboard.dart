part of 'package:crackit/app.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Txt(
              text: 'Dashboard',
              color: Colors.white,
            ),
          ),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
