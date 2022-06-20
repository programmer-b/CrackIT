part of 'package:crackit/app.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key, required this.menu}) : super(key: key);
  final Map<String, dynamic> menu;

  @override
  State<ComplexDrawer> createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.66,
        child: Scaffold(
            appBar: _appBar(title: Applications.fromJson(widget.menu).name),
            body: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                itemCount: widget.menu.length,
                itemBuilder: (BuildContext _, int index) {
                  return Mnu(
                    title: Applications.fromJson(widget.menu).menu![index].name,
                    icon: Applications.fromJson(widget.menu).menu![index].icon,
                    submenus: Applications.fromJson(widget.menu)
                        .menu![index]
                        .submenus,
                  );
                },
              ),
            )));
  }

  PreferredSizeWidget _appBar({String? title}) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Txt(
        text: title,
        color: Colors.black,
        textAlign: TextAlign.start,
        fontSize: 18,
      ),
    );
  }
}

class Mnu extends StatelessWidget {
  const Mnu(
      {Key? key,
      required this.title,
      required this.submenus,
      required this.icon,
      this.isTitle = false})
      : super(key: key);
  final String? title;
  final List<String>? submenus;
  final String? icon;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          dense: true,
          horizontalTitleGap: isTitle ? 0.0 : null,
          minLeadingWidth: 5,
          child: ExpansionTile(
            title: Txt(
              text: title,
              fullUpperCase: isTitle,
              color: isTitle ? Colors.black54 : null,
            ),
            leading: isTitle ? null : Icon(getIconUsingPrefix(name: icon!)),
            children: [
              for (int i = 0; i < submenus!.length; i++)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 40),
                  child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: _subMenu(title: submenus![i])),
                ),
            ],
            trailing: submenus!.isEmpty ? const SizedBox.shrink() : null,
          ),
        ));
  }

  Widget _subMenu({
    String? title,
  }) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -0, vertical: -4),
      title: Txt(text: title),
    );
  }
}
