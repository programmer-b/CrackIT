// ignore_for_file: unused_element

import 'package:crackit/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part './auth.dart';
part './employment.dart';
part './hrms.dart';
part './iam.dart';
part './jobs.dart';
part './leave.dart';
part './profile.dart';
part './setup.dart';
part './training.dart';

PreferredSizeWidget _appbar(
  BuildContext context, {
  Key? key,
  Widget? leading,
  bool automaticallyImplyLeading = true,
  Widget? title,
  List<Widget>? actions,
  Widget? flexibleSpace,
  PreferredSizeWidget? bottom,
  double? elevation,
  Color? shadowColor,
  ShapeBorder? shape,
  Color? backgroundColor = Colors.white,
  Color? foregroundColor,
  Brightness? brightness,
  IconThemeData? iconTheme,
  IconThemeData? actionsIconTheme,
  TextTheme? textTheme,
  bool primary = true,
  bool? centerTitle,
  bool excludeHeaderSemantics = false,
  double? titleSpacing,
  double toolbarOpacity = 1.0,
  double bottomOpacity = 1.0,
  double? toolbarHeight,
  double? leadingWidth,
  bool? backwardsCompatibility,
  TextStyle? toolbarTextStyle,
  TextStyle? titleTextStyle,
  SystemUiOverlayStyle? systemOverlayStyle,
}) {
  return AppBar(
    title: title,
    actions: [
      IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () => Navigator.pop(context),
      )
    ],
    centerTitle: true,
    backgroundColor: backgroundColor,
    elevation: 0,
    
  );
}
