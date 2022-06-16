part of 'package:crackit/app.dart';

class DashboardAppBar {
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

  static PreferredSizeWidget applicationsRouteAppBar() {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      title: const Txt(
          text: 'Applications', fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
