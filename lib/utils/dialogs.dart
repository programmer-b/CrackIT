part of 'package:crackit/app.dart';

class Dialog{
  void progress(BuildContext context, String title, String subTitle){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ListTile(
            leading: const CircularProgressIndicator(),
            title: Txt(text: title,),
            subtitle: Txt(text: subTitle,),
          ),

        );
      },
    );
  }
}