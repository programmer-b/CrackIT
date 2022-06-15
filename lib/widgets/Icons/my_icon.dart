part of 'package:crackit/app.dart';

class MyIcon extends StatelessWidget {
  const MyIcon(
      {Key? key, required this.icon, required this.iconColor, this.iconSize})
      : super(key: key);

  final IconData icon;
  final Color iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconColor, size: iconSize);
  }
}
