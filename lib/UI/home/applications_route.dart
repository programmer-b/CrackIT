part of 'package:crackit/app.dart';

class ApplicationsRoute extends StatefulWidget {
  const ApplicationsRoute({Key? key}) : super(key: key);

  @override
  State<ApplicationsRoute> createState() => _ApplicationsRouteState();
}

class _ApplicationsRouteState extends State<ApplicationsRoute> {
  List apps = [
    {'icon': 'Icons.apps', 'name': 'IAM & ADMIN', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'HRMS', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'AUTH', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'PROFILE', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'LEAVE MANAGEMENT', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'EMPLOYMENT STATUS', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'SETUP', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'JOBS', 'url': '/iam'},
    {'icon': 'Icons.apps', 'name': 'TRAINING', 'url': '/iam'}
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Center(
          child: Column(
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ApplicationIconButton(
                    icon: Icons.admin_panel_settings,
                    name: 'IAM & ADMIN',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.hd_rounded,
                    name: 'HRMS',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.account_circle,
                    name: 'PROFILE',
                    onTap: (){},
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ApplicationIconButton(
                    icon: Icons.password,
                    name: 'AUTH',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.leave_bags_at_home,
                    name: 'LEAVE',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.event_available,
                    name: 'EMPLOYMENT',
                    onTap: (){},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ApplicationIconButton(
                    icon: Icons.settings_accessibility_outlined,
                    name: 'SETUP',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.join_full,
                    name: 'JOBS',
                    onTap: (){},
                  ),
                  ApplicationIconButton(
                    icon: Icons.train,
                    name: 'TRAINING',
                    onTap: (){},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              
              
              

              
            ],
          ),
        ));
  }
}

class SearchApps extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
