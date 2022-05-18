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
    final pageState = context.read<PageState>();
    return DropdownButton<int>(
      value: pageValue.perPageValue,
      onChanged: (value) {
        api.get(url + '?page=' + pageState.currentPage + '&per-page=$value');
        pageValue.perPage(value!);
      },
      items: <int>[10, 25, 50, 100].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Txt(text: value.toString()),
        );
      }).toList(),
    );
  }
}
