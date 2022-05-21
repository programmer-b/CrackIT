part of 'package:crackit/app.dart';

class AddSetupScreen extends StatefulWidget {
  const AddSetupScreen({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  State<AddSetupScreen> createState() => _AddSetupScreenState();
}

class _AddSetupScreenState extends State<AddSetupScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final setup = Provider.of<SetupProvider>(context);
    final api = Provider.of<API>(context);
    int length = api.successMap['dataPayload']['data'][0].length;
    List<String> keyList =
        api.successMap['dataPayload']['data'][0].keys.toList();
    List<dynamic> valueList =
        api.successMap['dataPayload']['data'][widget.index].values.toList();
    debugPrint(valueList.toString());
    // for (var element in keyList) {debugPrint(element);}

    List data = List.filled(length - 2, '');
    return Scaffold(
        appBar: AppBar(
          title: Txt(
            text: '${setup.action} ${setup.name}',
          ),
          actions: setup.view
              ? [
                  Visibility(
                      visible: api.isLoading, child: const ProgressIndicator()),
                  IconButton(
                    onPressed: () async {
                      await api.delete(Urls.setup +
                          setup.postUrl +
                          '/soft/' +
                          api.successMap['dataPayload']['data'][widget.index]
                              ['id']);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trashCan,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  )
                ]
              : null,
        ),
        //hello
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      for (int i = 1; i < length - 1; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            initialValue: setup.view || setup.edit
                                ? valueList[i].toString()
                                : null,
                            readOnly: setup.view ? true : false,
                            onSaved: (value) {
                              data[i - 1] = value!;
                            },
                            validator: (value) {
                              if (api.dataError) {
                                return api.errorMap['errorPayload']['errors']
                                    [keyList[i]];
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label:
                                    Txt(text: keyList[i].replaceAll('_', ' ')),
                                hintText: keyList[i].replaceAll('_', ' ')),
                          ),
                        ),
                      if (setup.view)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            initialValue: api.successMap['dataPayload']['data']
                                [widget.index]['recordStatus']['label'],
                            readOnly: true,
                            decoration: const InputDecoration(
                              label: Txt(text: 'status'),
                            ),
                          ),
                        ),
                      if (setup.edit || setup.add)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              api.postInit();
                              Map<String, String> json = {};
                              formKey.currentState!.save();
                              //debugPrint(data.toString());
                              for (int i = 1; i < length - 1; i++) {
                                json[keyList[i]] = data[i - 1];
                              }
                              var body = jsonEncode(json);
                              debugPrint(body.toString());
                              dialog.progress(
                                  context, 'Submitting', 'please wait ...');
                              if (setup.add) {
                                await api.post(
                                    Urls.setup + setup.postUrl, body);
                              } else {
                                await api.put(
                                    Urls.setup +
                                        setup.postUrl +
                                        '/${api.successMap['dataPayload']['data'][widget.index]['id']}',
                                    body);
                              }
                              Navigator.of(context).pop();
                              if (formKey.currentState!.validate()) {
                                if (api.success) {
                                  Navigator.of(context).pop();
                                  var message = api.successMessage;
                                  debugPrint('message' + api.successMessage);
                                  context.read<API>().get(Urls.setup +
                                      "${setup.url}?page=${context.read<PageState>().currentPage}&per-page=${context.read<PageState>().perPageValue}");
                                  ArtSweetAlert.show(
                                      context: context,
                                      artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.success,
                                        title: message,
                                      ));
                                }
                              }
                              if (api.netError) {
                                var message = api.errorMessage;
                                ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.danger,
                                      title: message,
                                    ));
                              }
                            },
                            child: const Txt(text: 'Submit record'),
                          ),
                        )
                    ],
                  )),
            )));
  }
}

// return
