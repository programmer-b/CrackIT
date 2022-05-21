part of 'package:crackit/app.dart';

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
                    "$currentUrl?_search=" +
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
                  child: _dataTable(map(), api, context),
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
            child: _dataTable(map(), provider, context));
      },
    );
  }
}



