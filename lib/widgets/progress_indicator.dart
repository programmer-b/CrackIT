part of 'package:crackit/app.dart';

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator(
      {Key? key,
      this.scale = 0.38,
      this.width = 50.0,
      this.color = Colors.white})
      : super(key: key);

  final double scale;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.38,
        child: const SizedBox(
          width: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ));
  }
}
