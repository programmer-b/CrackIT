part of 'package:crackit/app.dart';

class ImmigrationScreen extends StatefulWidget {
  const ImmigrationScreen({Key? key}) : super(key: key);

  @override
  State<ImmigrationScreen> createState() => _ImmigrationScreenState();
}

class _ImmigrationScreenState extends State<ImmigrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Txt(
              text: 'Immigration',
              color: Colors.white,
            ),
          ),
          //drawer: const ComplexDrawer(),
        );
      },
    );
  }
}
