part of 'package:crackit/app.dart';

class HomeRouteAppBar {
  static PreferredSizeWidget homeRouteAppBar() {
    return AppBar(
        title:
            const Txt(text: 'Home', fontWeight: FontWeight.w500, fontSize: 20),
        actions: <Widget>[
          //IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Container(
            margin: const EdgeInsets.only(top: 3),
            child: NotificationIcon(
              iconColor: Colors.black54,
              onPressed: () {},
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ]);
  }
}
