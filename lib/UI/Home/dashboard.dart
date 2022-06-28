part of 'package:crackit/app.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

List dashboardScreens = [const HomeRoute(), const ApplicationsRoute()];
List dashboardAppbars = [
  DashboardAppBar.defaultAppBar(title: 'Home'),
  DashboardAppBar.defaultAppBar(title: 'Applications'),
];

int index = 0;

class _DashBoardState extends State<DashBoard> {
  var icon = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppbars[index],
      body: dashboardScreens[index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              backgroundColor: Colors.white,
              height: 90,
              selectedIndex: index,
              onDestinationSelected: (idx) => setState(() => index = idx),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  tooltip: 'Home dashboard',
                ),
                NavigationDestination(
                  icon: Icon(Icons.apps),
                  label: 'Apps',
                  tooltip: 'Applications',
                ),
              ])),

      //drawer: const ComplexDrawer(),
    );
  }
}
