part of 'package:crackit/app.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Txt(
              text: 'Certification',
              color: Colors.white,
            ),
          ),
          drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
