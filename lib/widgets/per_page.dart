part of 'package:crackit/app.dart';

class PerPage extends StatelessWidget {
  final API api;
  final String url;
  const PerPage({
    Key? key, required this.api, required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageValue = Provider.of<PageState>(context);
    return DropdownButton<int>(
      value: perPage,
      onChanged: (value) {
        api.get(url + '?per-page=$value');
        pageValue.perPage(value!);
      },
      items: <int>[10, 25, 50, 100].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: pageValue.perPageValue,
          child: Txt(text: value.toString()),
        );
      }).toList(),
    );
  }
}
