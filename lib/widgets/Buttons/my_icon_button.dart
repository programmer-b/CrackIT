part of 'package:crackit/app.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {Key? key,
      this.iconData,
      this.onPressed,
      this.splashColor,
      this.iconColor,
      this.iconSize})
      : super(key: key);
  final IconData? iconData;
  final Function()? onPressed;
  final Color? splashColor;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: iconColor,
        size: iconSize,
      ),
      onPressed: onPressed,
      splashColor: splashColor,
    );
  }
}
