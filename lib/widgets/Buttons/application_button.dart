part of 'package:crackit/app.dart';

class ApplicationButton extends StatelessWidget {
  const ApplicationButton(
      {Key? key, required this.text, this.width, this.onTap})
      : super(key: key);
  final String text;
  final double? width;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
          height: 90,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            color: Colors.grey[20],
          ),
          child: InkWell(
            splashColor: Colors.grey,
            onTap: onTap,
            child: Center(
              child: Txt(text: text, textAlign: TextAlign.center),
            ),
          )),
    );
  }
}
