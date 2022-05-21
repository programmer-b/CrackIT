part of 'package:crackit/app.dart';

class HomeSetupScreen extends StatefulWidget {
  const HomeSetupScreen({Key? key}) : super(key: key);

  @override
  State<HomeSetupScreen> createState() => _HomeSetupScreenState();
}

class _HomeSetupScreenState extends State<HomeSetupScreen> {
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
    return Container();
  }
}
