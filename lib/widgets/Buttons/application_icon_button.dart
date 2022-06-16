part of 'package:crackit/app.dart';

class ApplicationIconButton extends StatelessWidget {
  const ApplicationIconButton(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.onTap,
      this.icon,
      this.iconColor = Colors.green})
      : super(key: key);
  final Color backgroundColor;
  final void Function()? onTap;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              color: iconColor,
            )));
  }
}
