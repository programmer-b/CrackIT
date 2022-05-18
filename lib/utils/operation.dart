part of 'package:crackit/app.dart';

class Operation {
  void operation(API provider, BuildContext context, String url) {
    final pageState = context.read<PageState>();
    if (provider.operationSuccess) {
      Future.delayed(Duration.zero, () {
        var message = provider.successMessage;
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              title: message,
            ));
        context.read<API>().operationInit();
      });
    }
    if (provider.operationError) {
      Future.delayed(Duration.zero, () {
        var message = provider.errorMessage;
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: message,
            ));
        context.read<API>().operationInit();
      });
    }
    if (provider.operationDone) {
      Future.delayed(Duration.zero, () {
        context.read<API>().get(Urls.setup +
            url + '?page=' + pageState.currentPage +
            '&per-page=${context.read<PageState>().perPageValue}');
      });
    }
  }
}
