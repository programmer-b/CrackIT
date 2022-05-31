part of 'package:crackit/app.dart';

// class ComplexDrawer extends StatefulWidget {
//   const ComplexDrawer({Key? key}) : super(key: key);
//
//   @override
//   _ComplexDrawerState createState() => _ComplexDrawerState();
// }
//
// class _ComplexDrawerState extends State<ComplexDrawer> {
//   int selectedIndex = -1;
//
//   bool isExpanded = true;
//
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       width: width,
//       child: row(),
//       color: Colors.transparent,
//     );
//   }
//
//   Widget row() {
//     return Row(children: [
//       isExpanded ? blackIconTiles() : blackIconMenu(),
//       invisibleSubMenus(),
//     ]);
//   }
//
//   Widget blackIconTiles() {
//     return Container(
//       width: 200,
//       color: Colorz.complexDrawerCanvasColor,
//       child: Column(
//         children: [
//           controlTile(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: cdms.length,
//               itemBuilder: (BuildContext context, int index) {
//                 //  if(index==0) return controlTile();
//
//                 CDM cdm = cdms[index];
//                 bool selected = selectedIndex == index;
//                 return ExpansionTile(
//                     onExpansionChanged: (z) {
//                       setState(() {
//                         selectedIndex = z ? index : -1;
//                       });
//                     },
//                     leading: Icon(cdm.icon, color: Colorz.complexDrawerBlack),
//                     title: Txt(
//                       text: cdm.title,
//                       color: Colorz.complexDrawerBlack,
//                     ),
//                     trailing: cdm.submenus.isEmpty
//                         ? const SizedBox.shrink()
//                         : Icon(
//                             selected
//                                 ? Icons.keyboard_arrow_up
//                                 : Icons.keyboard_arrow_down,
//                             color: Colorz.complexDrawerBlack,
//                           ),
//                     children: cdm.submenus.map((subMenu) {
//                       return sMenuButton(
//                           subMenu,
//                           false,
//                           cdm.submenus
//                               .indexWhere((element) => element == subMenu));
//                     }).toList());
//               },
//             ),
//           ),
//           accountTile(),
//         ],
//       ),
//     );
//   }
//
//   Widget controlTile() {
//     return Container(
//       color: Colors.blueGrey,
//       height: AppBar().preferredSize.height * 1.5,
//       padding: const EdgeInsets.only(top: 18, bottom: 5),
//       child: ListTile(
//         leading: const FlutterLogo(),
//         title: const Txt(
//           text: "CrackIT",
//           fontSize: 18,
//           color: Colorz.complexDrawerCanvasColor,
//           fontWeight: FontWeight.bold,
//         ),
//
//         onTap: expandOrShrinkDrawer,
//       ),
//     );
//   }
//
//   Widget blackIconMenu() {
//     return AnimatedContainer(
//       duration: const Duration(seconds: 1),
//       width: 100,
//       color: Colorz.complexDrawerCanvasColor,
//       child: Column(
//         children: [
//           controlButton(),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: cdms.length,
//                 itemBuilder: (context, index) {
//                   // if(index==0) return controlButton();
//                   return InkWell(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                     child: Container(
//                       height: 45,
//                       alignment: Alignment.center,
//                       child: Icon(cdms[index].icon,
//                           color: Colorz.complexDrawerBlack),
//                     ),
//                   );
//                 }),
//           ),
//           accountButton(),
//         ],
//       ),
//     );
//   }
//
//   Widget invisibleSubMenus() {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       width: isExpanded ? 0 : 125,
//       color: Colors.transparent,
//       child: Column(
//         children: [
//           Container(height: 95),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: cdms.length,
//                 itemBuilder: (context, index) {
//                   CDM cmd = cdms[index];
//
//                   bool selected = selectedIndex == index;
//                   bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
//                   return subMenuWidget(
//                       [cmd.title, ...cmd.submenus], isValidSubMenu);
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget controlButton() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 30),
//       child: InkWell(
//         onTap: expandOrShrinkDrawer,
//         child: Container(
//           height: 45,
//           alignment: Alignment.center,
//           child: const FlutterLogo(
//             size: 40,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: isValidSubMenu
//               ? Colorz.complexDrawerCanvasColor
//               : Colors.transparent,
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(8),
//             bottomRight: Radius.circular(8),
//           )),
//       child: ListView.builder(
//           padding: const EdgeInsets.all(6),
//           itemCount: isValidSubMenu ? submenus.length : 0,
//           itemBuilder: (context, index) {
//             String subMenu = submenus[index];
//             return sMenuButton(subMenu, index == 0, index - 1);
//           }),
//     );
//   }
//
//   Widget sMenuButton(String subMenu, bool isTitle, int index) {
//     return InkWell(
//       onTap: () {
//         if (index != -1) {
//           debugPrint(index.toString());
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => pages.setup[index]));
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.only(top: 3, left: 50, bottom: 10),
//         alignment: Alignment.centerLeft,
//         child: Txt(
//           text: subMenu,
//           fontSize: isTitle ? 17 : 14,
//           color: isTitle ? Colorz.complexDrawerBlack : Colors.black54,
//           fontWeight: FontWeight.bold,
//           textAlign: TextAlign.start,
//         ),
//       ),
//     );
//   }
//
//   Widget accountButton({bool usePadding = true}) {
//     return Padding(
//       padding: EdgeInsets.all(usePadding ? 8 : 0),
//       child: AnimatedContainer(
//         duration: const Duration(seconds: 1),
//         height: 45,
//         width: 45,
//         decoration: BoxDecoration(
//           color: Colors.white70,
//           image: const DecorationImage(
//             image: NetworkImage(Urls.avatar2),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(6),
//         ),
//       ),
//     );
//   }
//
//   Widget accountTile() {
//     return Container(
//       color: Colorz.complexDrawerBlueGrey,
//       child: ListTile(
//         leading: accountButton(usePadding: false),
//         title: const Txt(
//           text: "Duncan",
//           color: Colors.white,
//         ),
//         subtitle: const Txt(
//           text: "Flutter Designer",
//           color: Colors.white70,
//         ),
//       ),
//     );
//   }

//   static List<CDM> cdms = [
//     // CDM(Icons.grid_view, "Control", []),
//
//     CDM(Icons.grid_view, "Dashboard", []),
//     CDM(Icons.subscriptions, "Setup", [
//       "Countries",
//       "Certification",
//       "Designation",
//       "Employment status",
//       "Immigration status",
//       "Organization"
//     ]),
//     CDM(Icons.markunread_mailbox, "Posts", ["Add", "Edit", "Delete"]),
//     CDM(Icons.pie_chart, "Analytics", []),
//     CDM(Icons.trending_up, "Chart", []),
//
//     CDM(Icons.power, "Plugins",
//         ["Ad Blocker", "Everything Https", "Dark Mode"]),
//     CDM(Icons.explore, "Explore", []),
//     CDM(Icons.settings, "Setting", []),
//   ];
//
//   void expandOrShrinkDrawer() {
//     setState(() {
//       isExpanded = !isExpanded;
//     });
//   }
// }

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
            body: SingleChildScrollView(
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
                    submenus: [

                    ],
                    icon: Icons.mark_chat_read,
                  ),
                  const Mnu(
                      title: 'MarketPlace', submenus: [], icon: Icons.dashboard),
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
                      title: 'Support', submenus: [], icon: Icons.app_registration),
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
                    submenus: [

                    ],
                    icon: Icons.mark_chat_read,
                  ),
                  const Mnu(
                      title: 'Cloud Run', submenus: [], icon: Icons.security_rounded),
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
                    submenus: [

                    ],
                    icon: Icons.mark_chat_read,
                  ),
                  const Mnu(
                      title: 'Firestorm', submenus: [], icon: Icons.fire_extinguisher),
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
                    submenus: [

                    ],
                    icon: Icons.mark_chat_read,
                  ),
                  const Mnu(
                      title: 'MarketPlace', submenus: [], icon: Icons.dashboard),
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
                      title: 'Support', submenus: [], icon: Icons.app_registration),
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
          //contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
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
    // actions: <Widget>[
    //   const AccountButton(
    //     padding: 10,
    //     backgroundColor: Colors.lightGreen,
    //   ),
    //   Dimens.actionsEnd(),
    // ],
    // bottom: PreferredSize(
    //     preferredSize: const Size.fromHeight(50.0), // here the desired height
    //     child: Column(
    //       children: <Widget>[
    //         Container(
    //           height: 0.7,
    //           color: Colors.grey,
    //         ),
    //         const ListTile(
    //           leading: Icon(Icons.dashboard),
    //           title: Txt(
    //             text: 'Dashboard',
    //           ),
    //         )
    //       ],
    //     )),
  );
}
