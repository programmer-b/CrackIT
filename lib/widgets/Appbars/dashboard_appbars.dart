part of 'package:crackit/app.dart';

class DashboardAppBar {
  static PreferredSizeWidget defaultAppBar({required String title}) {
    return AppBar(
        centerTitle: false,
        title: Txt(text: title, fontWeight: FontWeight.w500, fontSize: 20),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
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
