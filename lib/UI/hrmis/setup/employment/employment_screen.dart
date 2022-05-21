part of 'package:crackit/app.dart';

class EmploymentScreen extends StatefulWidget {
  const EmploymentScreen({Key? key}) : super(key: key);

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      context.read<API>().init();
      context.read<API>().get(Urls.setup +
          "/employment/status?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}");
      context.read<SetupProvider>().currentPageUp(
          url: '/employment',
          name: 'employment',
          title: 'Employment',
          postUrl: '/employment/status');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SetupRoot();
  }
}
