part of 'package:crackit/app.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                  indicatorColor: Colors.blue.shade100,
                  labelTextStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500))),
              child: NavigationBar(
                  backgroundColor: Colors.white,
                  height: 90,
                  selectedIndex: index,
                  onDestinationSelected: (idx) => setState(() => index = idx),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.email_outlined),
                      label: 'Mail',
                      tooltip: 'Email',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.chat_bubble_outlined),
                      label: 'Chat',
                      tooltip: 'Chat',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.group_outlined),
                      label: 'Spaces',
                      tooltip: 'Spaces',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.videocam_outlined),
                      label: 'Meet',
                      tooltip: 'Meet',
                    )
                  ])),
          key: scaffoldKey,
          appBar: AppBar(
              title: const Txt(
                text: 'Dashboard',
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: NotificationIcon(
                    iconColor: Colors.black54,
                    onPressed: () {},
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ]),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
