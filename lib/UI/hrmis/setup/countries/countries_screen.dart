part of 'package:crackit/app.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      context.read<API>().init();
      context.read<API>().get(Urls.setup + "/countries");
    });

    super.didChangeDependencies();
  }

  // _loadData() async {
  //   await context.read<API>().get(Urls.setup + "/countries");
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        map() {
          return provider.successMap['dataPayload']['data'];
        }

        _operation(provider, context);

        return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                Visibility(
                  visible: provider.isLoading,
                  child: Transform.scale(
                      scale: 0.38,
                      child: const SizedBox(
                        width: 50,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate());
                    },
                    icon: const Icon(Icons.search)),
                const AppBarMenu(url: Urls.setup + "/countries",),
              ],
              title: const Txt(
                text: 'Countries',
                color: Colors.white,
              ),
              // bottom: tableHead(),
            ),
            drawer: const ComplexDrawer(),
            body: provider.error
                ? APIError(
                    api: provider,
                    method: 'get',
                    url: '${Urls.setup}/countries')
                : provider.success
                    ? Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _dataTable(map(), provider))
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
          bottomNavigationBar: Pagination(provider: provider, url: Urls.setup + "/countries",),
        );
      },
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<String?>(
        future: storage.read(key: 'token'),
        builder: (context, token) {
          return FutureBuilder<http.Response>(
            future: http.get(
                Uri.parse(Urls.commonBase +
                    Urls.setup +
                    "/countries?_search=" +
                    query),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer ${token.data}'
                }),
            builder: (context, snapshot) {
              map() {
                return jsonDecode(snapshot.data!.body)['dataPayload']['data'];
              }

              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                //debugPrint(map().toString());
                return !map().toString().contains('[{')
                    ? Center(
                        child: Txt(text: map()),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _dataTable(map(), api),
                      );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        map() {
          return provider.successMap['dataPayload']['data'];
        }

        return Padding(
            padding: const EdgeInsets.all(8),
            child: _dataTable(map(), provider));
      },
    );
  }
}

Widget _dataTable(List<dynamic> map, API provider) {
  return DataTable(
      columns: [
        for (int i = 0; i < rowsAndColumns.countriesC.length; i++)
          rowsAndColumns.countriesC[i]
      ],
      rows: List<DataRow>.generate(map.length, (index) {
        return DataRow(cells: [
          for (int i = 0;
              i < rowsAndColumns.countriesR(map, index, provider).length;
              i++)
            rowsAndColumns.countriesR(map, index, provider)[i]
        ]);
      }));
}

void _operation(API provider, BuildContext context) {
  if (provider.operationSuccess) {
    Future.delayed(Duration.zero, () {
      var message = provider.successMessage;
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: message,
          ));
      context.read<API>().operationInit();
    });
  }
  if (provider.operationError) {
    Future.delayed(Duration.zero, () {
      var message = provider.errorMessage;
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: message,
          ));
      context.read<API>().operationInit();
    });
  }
  if (provider.operationDone) {
    Future.delayed(Duration.zero, () {
      context.read<API>().get(Urls.setup + "/countries");
    });
  }
}
