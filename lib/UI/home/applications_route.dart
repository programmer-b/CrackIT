part of 'package:crackit/app.dart';

class ApplicationsRoute extends StatefulWidget {
  const ApplicationsRoute({Key? key}) : super(key: key);

  @override
  State<ApplicationsRoute> createState() => _ApplicationsRouteState();
}

class _ApplicationsRouteState extends State<ApplicationsRoute> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: <Widget>[
              SearchBarButton(
                onTap: () =>
                    showSearch(context: context, delegate: SearchApps()),
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
