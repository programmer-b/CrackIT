part of 'package:crackit/app.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MyIcon(
                icon: Icons.home_max_outlined,
                iconColor: Colors.green,
                iconSize: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Txt(
                text: 'Home',
              )
            ],
          ),
        ));
  }

  
}
