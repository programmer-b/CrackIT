part of 'package:crackit/app.dart';

class SetupRoot extends StatelessWidget {
  const SetupRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SetupProvider>(
      builder: (context, setup, child) {
        return Consumer<API>(
          builder: (context, provider, child) {
            map() {
              return provider.successMap['dataPayload']['data'];
            }

            operation.operation(provider, context, setup.url);

            return Scaffold(
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  actions: [
                    Visibility(
                      visible: provider.isLoading,
                      child: const ProgressIndicator()
                    ),
                    if (provider.success)
                      IconButton(
                          onPressed: () {
                            showSearch(
                                context: context, delegate: MySearchDelegate());
                            currentUrl = setup.url;
                          },
                          icon: const Icon(Icons.search)),
                    if (provider.success)
                      AppBarMenu(
                        url: Urls.setup + setup.url,
                        name: setup.name,
                      ),
                  ],
                  title: Txt(
                    text: setup.title,
                    color: Colors.white,
                  ),
                  // bottom: tableHead(),
                ),
                drawer: const ComplexDrawer(),
                body: provider.error
                    ? APIError(
                        api: provider,
                        method: 'get',
                        url: Urls.setup + setup.url)
                    : provider.success
                        ? Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _dataTable(map(), provider, context))
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                bottomNavigationBar: provider.success
                    ? Pagination(
                        url: Urls.setup + setup.url,
                      )
                    : null);
          },
        );
      },
    );
  }
}
