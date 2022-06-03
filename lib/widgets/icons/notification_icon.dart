// ignore_for_file: unnecessary_new

part of 'package:crackit/app.dart';

class NotificationIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final double size;
  final bool hasDot;
  final Color iconColor;
  final Color dotColor;
  final double dotPositionRight;
  final double dotPositionTop;
  const NotificationIcon(
      {Key? key,
      this.onPressed,
      this.icon = Icons.notifications,
      this.hasDot = true,
      this.size = 24,
      this.iconColor = Colors.white,
      this.dotColor = Colors.red,
      this.dotPositionRight = 12,
      this.dotPositionTop = 10})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            size: size,
            color: iconColor
          ),
          onPressed: onPressed,
        ),
        if (hasDot) _redDot(),
      ],
    );
  }

  Widget _redDot() {
    return Positioned(
      right: 12,
      top: 10,
      child: Container(
        decoration: BoxDecoration(
          color: dotColor,
          borderRadius: BorderRadius.circular(7),
        ),
        constraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        child: const SizedBox(
          width: 1,
          height: 1,
        ),
      ),
    );
  }
}
