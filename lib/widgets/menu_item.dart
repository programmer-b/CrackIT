part of 'package:crackit/app.dart';

class OperationItem extends StatelessWidget {
  const OperationItem(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: color,
        ),
        const SizedBox(
          width: 8,
        ),
        Txt(
          text: text,
          fontSize: 16,
        ),
      ],
    );
  }
}
