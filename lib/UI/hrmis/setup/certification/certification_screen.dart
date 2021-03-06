part of 'package:crackit/app.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      context.read<API>().init();
      context.read<API>().get(Urls.setup +
          "/countries?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}");
      context.read<SetupProvider>().currentPageUp(url: '/countries', name: 'country' ,  title: 'Countries', postUrl: '/country');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SetupRoot();
  }
}
