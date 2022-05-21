part of 'package:crackit/app.dart';

class DesignationScreen extends StatefulWidget {
  const DesignationScreen({Key? key}) : super(key: key);

  @override
  State<DesignationScreen> createState() => _DesignationScreenState();
}

class _DesignationScreenState extends State<DesignationScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      context.read<API>().init();
      context.read<API>().get(Urls.setup +
          "/designation?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}");
      context.read<SetupProvider>().currentPageUp(
          url: '/designation',
          name: 'designation',
          title: 'Designation',
          postUrl: '/designation');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SetupRoot();
  }
}
