part of 'package:crackit/app.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    final double? width = MediaQuery.of(context).size.width / 2 - 30;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ApplicationButton(
                    text: 'Dynamic Form1',
                    width: width,
                    onTap: () => Navigator.pushNamed(context, '/sample_form_1')),
                ApplicationButton(
                    text: 'Dynamic Form2',
                    width: width,
                    onTap: () => Navigator.pushNamed(context, '/sample_form_2')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ApplicationButton(
                    text: 'Sample table1', width: width, onTap: () {}),
                ApplicationButton(
                    text: 'Sample table2', width: width, onTap: () {}),
              ],
            ),
          ],
        ));
  }
}
