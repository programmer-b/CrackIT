import 'dart:developer';

import 'package:flutter/material.dart';

class SampleForm1 extends StatefulWidget {
  const SampleForm1({Key? key}) : super(key: key);

  @override
  State<SampleForm1> createState() => _SampleForm1State();
}

class _SampleForm1State extends State<SampleForm1> {
  @override
  Widget build(BuildContext context) {
    return const Test();
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var nameTECs = <int, TextEditingController>{};
  var mailTECs = <int, TextEditingController>{};
  List<Entry> entries = [];

  var item = <int, Widget>{};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    item.addAll({0: newMethod(context, 0)});
  }

  ondDone() {
    entries.clear();
    for (int i = 0; i <= nameTECs.keys.last; i++) {
      var name = nameTECs[i]?.value.text;
      var mail = mailTECs[i]?.value.text;

      // log(mailTECs[i]?.value.text);
      if (name != null && mail != null) {
        entries.add(Entry(name, mail));
      }
    }
    log(entries.toString());
    for (int a = 0; a < entries.length; a++) {
      log(entries[a].name!);
      log(entries[a].email!);
    }
  }

  newMethod(
    BuildContext context,
    int index,
  ) {
    var nameController = TextEditingController();
    var mailController = TextEditingController();
    nameTECs.addAll({index: nameController});
    mailTECs.addAll({index: mailController});
    return Column(
      children: [
        Text(index.toString()),
        TextFormField(
          controller: nameController,
          validator: (value) {
            return value!.isEmpty ? 'Enter some text' : null;
          },
          decoration: const InputDecoration(hintText: "Name"),
        ),
        TextFormField(
          controller: mailController,
          validator: (value) {
            return value!.isEmpty ? 'Enter email' : null;
          },
          decoration: const InputDecoration(hintText: "Email"),

          // controller: nameCount,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  item.removeWhere((key, value) => key == index);
                  nameTECs.removeWhere((key, value) => key == index);
                  mailTECs.removeWhere((key, value) => key == index);
                });
              },
              child: const Text('Remove'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          TextButton(
            onPressed: () {
              item.addAll(
                  {item.keys.last + 1: newMethod(context, item.keys.last + 1)});
              setState(() {});

              // }
            },
            child: const Text('ADD'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: item.length,
                    itemBuilder: (context, index) {
                      return item.values.elementAt(index);
                    }),

                // for (int i = 0; i < widgeta.length; i++) widgeta[i],
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ondDone();
                      // _formKey.currentState!.save();
                      setState(() {});
                    }
                  },
                  child: const Text('save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Entry {
  final String? name;
  final String? email;

  Entry(
    this.name,
    this.email,
  );
}
