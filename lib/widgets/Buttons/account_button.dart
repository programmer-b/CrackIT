part of 'package:crackit/app.dart';

class AccountButton extends StatelessWidget {
  const AccountButton(
      {Key? key, this.width, this.backgroundColor, this.onTap, this.padding})
      : super(key: key);
  final double? width;
  final double? padding;
  final Color? backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.all(padding!),
            decoration:
                BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
            child: const Center(
              child: Icon(
                FontAwesomeIcons.userLarge,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
