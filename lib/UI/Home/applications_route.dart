part of 'package:crackit/app.dart';

class ApplicationsRoute extends StatefulWidget {
  const ApplicationsRoute({Key? key}) : super(key: key);

  @override
  State<ApplicationsRoute> createState() => _ApplicationsRouteState();
}

class _ApplicationsRouteState extends State<ApplicationsRoute> {
  var apps = map;

  @override
  Widget build(BuildContext context) {
    final double appWidth = MediaQuery.of(context).size.width / 3;
    final itemCount = apps.length / 3;
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Center(
          child: ListView.builder(
              itemCount: itemCount.ceil(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int? i = 0;
                            i! < 3 && index * 3 + i < apps.length;
                            i++)
                          ApplicationIconButton(
                            onTap: () {
                              setState(() => currentApp = index * 3 + i!);
                              debugPrint(
                                  'currentApp: $currentApp index: $index');
                              Navigator.pushNamed(
                                  context,
                                  Applications.fromJson(apps[index * 3 + i!])
                                      .url!);
                            },
                            width: appWidth,
                            icon: getIconUsingPrefix(
                                name: Applications.fromJson(apps[index * 3 + i])
                                    .icon!),
                            name: Applications.fromJson(apps[index * 3 + i])
                                .name!,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              })),
    );
  }
}
