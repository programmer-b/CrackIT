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
      context.read<SetupProvider>().currentPageUp(
          url: '/countries',
          name: 'country',
          title: 'Countries',
          postUrl: '/country');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SetupRoot();
  }
}
