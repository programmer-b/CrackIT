part of 'package:crackit/app.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  State<ComplexDrawer> createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.66,
        child: Scaffold(
            appBar: _appBar(),
            body: Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Mnu(
                        title: 'Dashboard', submenus: [], icon: Icons.dashboard),
                    Mnu(
                        title: 'Cloud overview',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.cloud),
                    Mnu(
                      title: 'Compute engine',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                      isTitle: true,
                      title: 'compute',
                      submenus: [],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                        title: 'MarketPlace',
                        submenus: [],
                        icon: Icons.dashboard),
                    Mnu(
                        title: 'Billing',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.mark_chat_read),
                    Mnu(
                      title: 'APIs & Services',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.bike_scooter,
                    ),
                    const Mnu(
                        title: 'Support',
                        submenus: [],
                        icon: Icons.app_registration),
                    Mnu(
                        title: 'IAM & Admin',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.supervised_user_circle),
                    Mnu(
                      title: 'Getting started',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.image_aspect_ratio,
                    ),
                    const Mnu(
                        title: 'Compliance', submenus: [], icon: Icons.get_app),
                    Mnu(
                        title: 'Cloud overview',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.compare),
                    Mnu(
                      title: 'Security',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.security,
                    ),
                    const Mnu(
                      isTitle: true,
                      title: 'Serverless',
                      submenus: [],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                        title: 'Cloud Run',
                        submenus: [],
                        icon: Icons.security_rounded),
                    Mnu(
                        title: 'Cloud Functions',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.functions),
                    Mnu(
                      title: 'App Engine',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.engineering,
                    ),
                    const Mnu(
                      isTitle: true,
                      title: 'Storage',
                      submenus: [],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                        title: 'Firestorm',
                        submenus: [],
                        icon: Icons.fire_extinguisher),
                    Mnu(
                        title: 'Cloud Storage',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.start),
                    Mnu(
                      title: 'Data Transfer',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.track_changes,
                    ),
                    Mnu(
                        title: 'Cloud overview',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.cloud),
                    Mnu(
                      title: 'Compute engine',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                      isTitle: true,
                      title: 'compute',
                      submenus: [],
                      icon: Icons.mark_chat_read,
                    ),
                    const Mnu(
                        title: 'MarketPlace',
                        submenus: [],
                        icon: Icons.dashboard),
                    Mnu(
                        title: 'Billing',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.mark_chat_read),
                    Mnu(
                      title: 'APIs & Services',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.bike_scooter,
                    ),
                    const Mnu(
                        title: 'Support',
                        submenus: [],
                        icon: Icons.app_registration),
                    Mnu(
                        title: 'IAM & Admin',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.supervised_user_circle),
                    Mnu(
                      title: 'Getting started',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.image_aspect_ratio,
                    ),
                    const Mnu(
                        title: 'Compliance', submenus: [], icon: Icons.get_app),
                    Mnu(
                        title: 'Cloud overview',
                        submenus: [
                          subMenu(title: 'Dashboard'),
                          subMenu(title: 'Activity'),
                          subMenu(title: 'Recommendations'),
                        ],
                        icon: Icons.compare),
                    Mnu(
                      title: 'Security',
                      submenus: [
                        subMenu(title: 'Virtual machines'),
                        subMenu(title: 'Analogue electronics'),
                        subMenu(title: 'Digital electronics'),
                      ],
                      icon: Icons.security,
                    ),
                  ],
                ),
              ),
            )));
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
  final String title;
  final List<Widget> submenus;
  final IconData icon;
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
            leading: isTitle ? null : Icon(icon),
            children: [
              for (int i = 0; i < submenus.length; i++)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: submenus[i],
                  ),
                ),
            ],
            trailing: submenus.isEmpty ? const SizedBox.shrink() : null,
          ),
        ));
  }
}

Widget subMenu({
  String? title,
}) {
  return ListTile(
    visualDensity: const VisualDensity(horizontal: -0, vertical: -4),
    title: Txt(text: title),
  );
}

PreferredSizeWidget _appBar() {
  return AppBar(
    elevation: 0.0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: const Txt(
      text: 'CrackIT Technologies'
          '',
      color: Colors.black,
      textAlign: TextAlign.start,
      fontSize: 18,
    ),
  );
}
