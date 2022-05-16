part of 'package:crackit/app.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1;

  bool isExpanded = true;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      color: Colors.transparent,
    );
  }

  Widget row() {
    return Row(children: [
      isExpanded ? blackIconTiles() : blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 200,
      color: Colorz.complexDrawerCanvasColor,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
              itemCount: cdms.length,
              itemBuilder: (BuildContext context, int index) {
                //  if(index==0) return controlTile();

                CDM cdm = cdms[index];
                bool selected = selectedIndex == index;
                return ExpansionTile(
                    onExpansionChanged: (z) {
                      setState(() {
                        selectedIndex = z ? index : -1;
                      });
                    },
                    leading: Icon(cdm.icon, color: Colorz.complexDrawerBlack),
                    title: Txt(
                      text: cdm.title,
                      color: Colorz.complexDrawerBlack,
                    ),
                    trailing: cdm.submenus.isEmpty
                        ? const SizedBox.shrink()
                        : Icon(
                            selected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colorz.complexDrawerBlack,
                          ),
                    children: cdm.submenus.map((subMenu) {
                      return sMenuButton(
                          subMenu,
                          false,
                          cdm.submenus
                              .indexWhere((element) => element == subMenu));
                    }).toList());
              },
            ),
          ),
          accountTile(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Container(
      color: Colors.blueGrey,
      height: AppBar().preferredSize.height * 1.5,
      padding: const EdgeInsets.only(top: 18, bottom: 5),
      child: ListTile(
        leading: const FlutterLogo(),
        title: const Txt(
          text: "CrackIT",
          fontSize: 18,
          color: Colorz.complexDrawerCanvasColor,
          fontWeight: FontWeight.bold,
        ),

        onTap: expandOrShrinkDrawer,
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: 100,
      color: Colorz.complexDrawerCanvasColor,
      child: Column(
        children: [
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon,
                          color: Colorz.complexDrawerBlack),
                    ),
                  );
                }),
          ),
          accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  CDM cmd = cdms[index];

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget(
                      [cmd.title, ...cmd.submenus], isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: const FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu
              ? Colorz.complexDrawerCanvasColor
              : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: const EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0, index - 1);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle, int index) {
    return InkWell(
      onTap: () {
        if (index != -1) {
          debugPrint(index.toString());
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => pages.setup[index]));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 3, left: 50, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Txt(
          text: subMenu,
          fontSize: isTitle ? 17 : 14,
          color: isTitle ? Colorz.complexDrawerBlack : Colors.black54,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: const DecorationImage(
            image: NetworkImage(Urls.avatar2),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: Colorz.complexDrawerBlueGrey,
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: const Txt(
          text: "Duncan",
          color: Colors.white,
        ),
        subtitle: const Txt(
          text: "Flutter Designer",
          color: Colors.white70,
        ),
      ),
    );
  }

  static List<CDM> cdms = [
    // CDM(Icons.grid_view, "Control", []),

    CDM(Icons.grid_view, "Dashboard", []),
    CDM(Icons.subscriptions, "Setup", [
      "Countries",
      "Certification",
      "Designation",
      "Employment status",
      "Immigration status",
      "Organization"
    ]),
    CDM(Icons.markunread_mailbox, "Posts", ["Add", "Edit", "Delete"]),
    CDM(Icons.pie_chart, "Analytics", []),
    CDM(Icons.trending_up, "Chart", []),

    CDM(Icons.power, "Plugins",
        ["Ad Blocker", "Everything Https", "Dark Mode"]),
    CDM(Icons.explore, "Explore", []),
    CDM(Icons.settings, "Setting", []),
  ];

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
