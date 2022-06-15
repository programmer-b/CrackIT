part of 'package:crackit/app.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({Key? key, required this.url,}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    final setup = context.read<SetupProvider>();
    return PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case MenuItem.item1:
              {
                Future.delayed(Duration.zero, () {
                  context.read<API>().init();
                  context.read<API>().get(url +
                      '?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}');
                });
              }
              break;
            case MenuItem.item2:
              {
                Future.delayed(Duration.zero, () {
                  setup.addState();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSetupScreen()));
                });
              }
              break;
          }
        },
        itemBuilder: (context) => [
              const PopupMenuItem(
                child: OperationItem(
                    text: 'Refresh',
                    icon: Icons.rotate_left,
                    color: Colors.green),
                value: MenuItem.item1,
              ),
           PopupMenuItem(
            child: OperationItem(
                text: 'add ${setup.name}',
                icon: Icons.rotate_left,
                color: Colors.green),
            value: MenuItem.item2,
          ),
              const PopupMenuItem(
                child: OperationItem(
                    text: 'Messages', icon: Icons.message, color: Colors.green),
                value: MenuItem.item3,
              ),
              const PopupMenuItem(
                  child: OperationItem(
                      text: 'Logout', icon: Icons.logout, color: Colors.green),
                  value: MenuItem.item4)
            ]);
  }
}
