part of 'package:crackit/app.dart';

class StatusTray extends StatelessWidget {
  const StatusTray({Key? key, required this.theme, required this.label}) : super(key: key);

  final String theme;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          color: Colorz.statusTheme(theme),

        ),
        child: Center(child: Txt(text: label),),
      ),
    );
  }
}
