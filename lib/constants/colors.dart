part of 'package:crackit/app.dart';

class Colorz {

  static const Color timerBlue = Color(0xff1c77dd);
  static const Color editorBlue = Color(0xff1c77dd);

  static const Color backgroundBlue = Color(0xff1b81f1);

  static const Color accountPurple = Color(0xff5b60ec);

  static const Color currenciesPageBackground = Color(0xff0f1e4e);
  static const Color currenciesNameColor = Color(0xff7080b3);
  static const Color currencyPositiveGreen = Color(0xff0eff7e);
  static const Color currencyIndicatorColor = Color(0xff6170f3);

  static const Color sendMoneyBlue = Color(0xff4285f4);

  static const Color googleResultsGrey = Color(0xffeff4f2);


  // static const Color complexDrawerScaffoldColor = Color(0xfe3e9f7);
  static const Color complexDrawerCanvasColor = Color(0xffe3e9f7);
  static const Color complexDrawerBlack = Color(0xff11111d);
  static const Color complexDrawerBlueGrey = Color(0xff1d1b31);



  //interlaced dashboard
  static const Color interlacedBackground = Color(0xfff7f8fa);
  static const Color interlacedAvatarBorderBlue = Color(0xff2554fc);
  static const Color interlacedChatPurple = Color(0xff8532fb);


  //richCalculator
  static const Color richCalculatorCanvas = Color(0xff222433);
  static const Color richCalculatorOuterButtonColor = Color(0xff333549);
  static const Color richCalculatorInnerButtonColor = Color(0xff2c2e41);
  static const Color richCalculatorYellowButtonColor = Color(0xffffba01);

  static const Color success = Color(0xff28a745);
  static const Color danger = Color(0xffdc3545);
  static const Color warning = Color(0xffffc107);


  //buttonExample
  static const Color buttonExampleCanvas = Color(0xfff3f6ff);
  static const Color buttonSampleColor = Color(0xff7c2ae8);

  static Color? statusTheme(String theme){
    switch(theme){
      case 'success':
        return success;
      case 'danger':
        return danger;
      case 'warning':
        return warning;
    }
    return null;
  }

}