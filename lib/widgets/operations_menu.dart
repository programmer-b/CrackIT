part of 'package:crackit/app.dart';

class OperationsMenu extends StatelessWidget {
  const OperationsMenu(
      {Key? key,
      required this.code,
      required this.api,
      required this.id,
      required this.url})
      : super(key: key);
  final int code;
  final API api;
  final String id;
  final String url;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Operations>(
      padding: const EdgeInsets.all(2),
      onSelected: (value) async {
        switch (value) {
          case Operations.activate:
            {
              Map json = {'status': '10'};
              var body = jsonEncode(json);
              api.status(url + '/status/' + id, body);
            }

            break;
          case Operations.restore:
            api.restore(url + '/restore/' + id);

            break;
          case Operations.delete:
            api.delete(url + '/soft/' + id);

            break;
          case Operations.deactivate:
            {
              Map json = {'status': '9'};
              var body = jsonEncode(json);
              api.status(url + '/status/' + id, body);
            }
            break;
          case Operations.view:
            break;
          case Operations.edit:
            break;
        }
      },
      itemBuilder: (context) {
        return [
          if (code == 9 || code == 10)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'View',
                  icon: FontAwesomeIcons.eye,
                  color: Colorz.success),
              value: Operations.view,
            ),
          if (code == 9)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'Activate',
                  icon: FontAwesomeIcons.circleCheck,
                  color: Colorz.success),
              value: Operations.activate,
            ),
          if (code == 10)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'Deactivate',
                  icon: FontAwesomeIcons.ban,
                  color: Colorz.warning),
              value: Operations.deactivate,
            ),
          if (code == 9 || code == 10)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'Edit',
                  icon: FontAwesomeIcons.penToSquare,
                  color: Colorz.editorBlue),
              value: Operations.edit,
            ),
          if (code == 9 || code == 10)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'Delete',
                  icon: FontAwesomeIcons.trash,
                  color: Colorz.danger),
              value: Operations.delete,
            ),
          if (code == 8)
            const PopupMenuItem(
              child: OperationItem(
                  text: 'Restore',
                  icon: FontAwesomeIcons.rotateLeft,
                  color: Colorz.warning),
              value: Operations.restore,
            ),
        ];
      },
    );
  }
}
