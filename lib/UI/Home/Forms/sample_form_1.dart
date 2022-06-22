part of 'package:crackit/app.dart';

class SampleForm1 extends StatefulWidget {
  const SampleForm1({Key? key}) : super(key: key);

  @override
  State<SampleForm1> createState() => _SampleForm1State();
}

class _SampleForm1State extends State<SampleForm1> {
  List list = [];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(text: 'Dynamic form', fullUpperCase: true),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
              },
              child: const Txt(text: 'save', fullUpperCase: true)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              for (int i = 0; i < count; i++) _form(i),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() => count++),
          label: const Txt(
            text: 'Add form',
          ),
          icon: const Icon(Icons.add)),
    );
  }

  Widget _form(int index) {
    return Column(
      children: [
        Card(
            elevation: 2,
            child: Container(
              width: double.infinity,
              height: 180 + 26,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[200]!)),
              child: Column(children: <Widget>[
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[400]!))),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Txt(
                          text: "Form ${index + 1}",
                          fullUpperCase: true,
                        ),
                        TextButton(
                          onPressed: () => setState(() => count --),
                          child: const Txt(text: 'Remove', fullUpperCase: true),
                        )
                      ],
                    )),
                Container(
                    height: 133 + 26,
                    color: Colors.grey[300]!,
                    padding: const EdgeInsets.all(4),
                    child: Column(children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          list.insert(index, {"firstName": value});
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'First name'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          list.insert(index, {"lastName": value});
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Last name'),
                      )
                    ]))
              ]),
            )),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
