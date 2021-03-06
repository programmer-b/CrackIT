part of 'package:crackit/app.dart';

class Pagination extends StatelessWidget {
  const Pagination({Key? key, required this.url})
      : super(key: key);

  final String url;
  @override
  Widget build(BuildContext context) {
    final pageState = context.read<PageState>();
    final provider = context.read<API>();
    int? currentPage = provider.successMap['dataPayload']['currentPage'] ?? '';
    bool _hasPrevious() {
      return currentPage == 1;
    }

    bool _hasNext() {
      return currentPage == provider.successMap['dataPayload']['totalPages'];
    }

    String _next() {
      int current = currentPage! + 1;
      String page = current.toString();
      pageState.page(page);
      return '?page=' + page;
    }

    String _previous() {
      int current = currentPage! - 1;
      String page = current.toString();
      pageState.page(page);
      return '?page=' + page;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // PerPage(
          //   url: url,
          //   api: provider,
          // ),
          Txt(
              text:
                  '${provider.successMap['dataPayload']['countOnPage'] ?? ''} of ${provider.successMap['dataPayload']['totalCount'] ?? ''}'),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.angleLeft,
                    color: _hasPrevious() ? Colors.black : Colors.blue,
                  ),
                  onPressed: _hasPrevious()
                      ? null
                      : () {
                          provider.get(url +
                              _previous() +
                              '&per-page=${context.read<PageState>().perPageValue}');
                        }),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 20,
                color: Colors.black,
                width: 1,
              ),
              const SizedBox(
                width: 5,
              ),
              Txt(
                text:
                    ' ${currentPage ?? ''} / ${provider.successMap['dataPayload']['totalPages'] ?? ''} ',
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 20,
                color: Colors.black,
                width: 1,
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.angleRight,
                    color: _hasNext() ? Colors.black : Colors.blue,
                  ),
                  onPressed: _hasNext()
                      ? null
                      : () {
                          provider.get(url +
                              _next() +
                              '&per-page=${context.read<PageState>().perPageValue}');
                        }),
            ],
          )
        ],
      ),
    );
  }
}
