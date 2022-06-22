part of 'package:crackit/app.dart';

class SampleForm2 extends StatefulWidget {
  const SampleForm2({Key? key}) : super(key: key);

  @override
  State<SampleForm2> createState() => _SampleForm2State();
}

class _SampleForm2State extends State<SampleForm2> {
  late int _count;
  late List<Map<String, dynamic>> _values;
  late String _result;
  @override
  void initState() {
    super.initState();
    _count = 0;
    _values = [];
    _result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Txt(
              text: 'Dynamic Form 2',
              fullUpperCase: true,
            ),
            actions: [
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _count++)),
              IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => setState(() {
                        _count = 0;
                        _values = [];
                        _result = '';
                      }))
            ]),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _count,
                      itemBuilder: (context, index) {
                        return _row(index);
                      }),
                ),
                const SizedBox(height: 10),
                Expanded(child: Txt(text: _result))
              ],
            )));
  }

  Widget _row(int key) {
    return Row(children: [
      Txt(
        text: 'ID: $key',
      ),
      const SizedBox(
        width: 30,
      ),
      Expanded(child: TextFormField(onChanged: (val) => onUpdate(key, val)))
    ]);
  }

  onUpdate(int key, String val) {
    int _foundKey = -1;
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          _foundKey = key;
          break;
        }
      }
    }

    if (-1 != _foundKey) {
      _values.removeWhere((map) {
        return map['id'] == _foundKey;
      });
    }
    Map<String, dynamic> json = {"id": key, "value": {"text": val}};
    _values.add(json);

    setState(() => _result = _prettyPrint(_values));
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('   ');
    return encoder.convert(jsonObject);
  }
}
