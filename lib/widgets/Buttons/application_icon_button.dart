part of 'package:crackit/app.dart';

class ApplicationIconButton extends StatelessWidget {
  const ApplicationIconButton(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.onTap,
      this.icon,
      this.iconColor = Colors.green,
      this.name,
      this.iconSize = 35,
      this.width = 90,
      this.textSize = 12})
      : super(key: key);
  final Color backgroundColor;
  final void Function()? onTap;
  final IconData? icon;
  final Color iconColor;
  final String? name;
  final double iconSize;
  final double width;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 90,
      child: InkWell(
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: backgroundColor),
                    padding: const EdgeInsets.all(6),
                    child: Icon(icon, color: iconColor, size: iconSize),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Txt(
                      text: name,
                      color: Colors.black54,
                      fontSize: textSize,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          )),
    );
  }
}
