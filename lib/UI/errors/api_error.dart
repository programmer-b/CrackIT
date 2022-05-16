part of 'package:crackit/app.dart';

class APIError extends StatefulWidget {
  const APIError({Key? key, required this.api, this.method, this.url}) : super(key: key);
  final API api;
  final String? method;
  final String? url;


  @override
  State<APIError> createState() => _APIErrorState();
}

class _APIErrorState extends State<APIError> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Txt(text: widget.api.errorMessage, fontSize: 17,),
            const SizedBox(
              height: 26,
            ),
            ElevatedButton(
                onPressed: () {
                  if (widget.api.catchError) {
                    widget.api.init();
                    if(widget.method == 'get'){
                      debugPrint(widget.url);
                      widget.api.get(widget.url);
                    }
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: Txt(
                  text: widget.api.actionMessage,
                ))
          ],
        ),
      ),
    );
  }
}
