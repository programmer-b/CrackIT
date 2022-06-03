part of 'package:crackit/app.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              title: const Txt(
                text: 'Dashboard',
                color: Colors.white,
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                NotificationIcon(
                  onPressed: () {},
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ]),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
