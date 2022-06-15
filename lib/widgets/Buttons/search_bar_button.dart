part of 'package:crackit/app.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                  Txt(
                    text: 'Search applications',
                  )
                ],
              )),
        ));
  }
}
