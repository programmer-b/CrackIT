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
      context.read<API>().get(Urls.setup +
          "/countries?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}");
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        map() {
          return provider.successMap['dataPayload']['data'];
        }

        operation.operation(provider, context, '/countries');

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
                      currentUrl = '/countries';
                    },
                    icon: const Icon(Icons.search)),
                const AppBarMenu(
                  url: Urls.setup + "/countries",
                ),
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
            bottomNavigationBar: provider.success
                ? Pagination(
                    provider: provider,
                    url: Urls.setup + "/countries",
                  )
                : null);
      },
    );
  }
}
