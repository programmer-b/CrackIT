import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import './UI/Home/Apps/apps.dart';

part './UI/auth/login_screen.dart';
part './UI/Home/dashboard.dart';
part './UI/Home/applications_route.dart';
part './UI/Home/home_route.dart';
part './widgets/Drawer/drawer.dart';
part './UI/hrmis/setup/certification/certification_screen.dart';
part './UI/hrmis/setup/countries/countries_screen.dart';
part './UI/hrmis/setup/designation/designation_screen.dart';
part './UI/hrmis/setup/employment/employment_screen.dart';
part './UI/hrmis/setup/immigration/immigration_screen.dart';
part './UI/hrmis/setup/organization/organization_screen.dart';
part './UI/hrmis/setup/setup_operation_screen.dart';
part './UI/errors/api_error.dart';
part './provider/api.dart';
part './constants/assets.dart';
part './constants/colors.dart';
part './constants/enums.dart';
part './constants/pages.dart';
part './constants/urls.dart';
part './constants/dimens.dart';
part './constants/strings.dart';
part './models/cdm.dart';
part './models/applications.dart';
part './utils/dialogs.dart';
part './widgets/Appbars/dashboard_appbars.dart';
part './widgets/Buttons/my_button.dart';
part './widgets/Appbars/appbar.dart';
part './widgets/txt.dart';
part './widgets/status_tray.dart';
part './widgets/Buttons/my_icon_button.dart';
part './widgets/menu_item.dart';
part './widgets/operations_menu.dart';
part './widgets/Appbars/app_bar_menu.dart';
part './widgets/DataTable/data_table.dart';
part './widgets/progress_indicator.dart';
part './models/data_table.dart';
part './widgets/DataTable/rows_and_columns.dart';
part './widgets/pagination_widget.dart';
part './widgets/Buttons/account_button.dart';
part './widgets/per_page.dart';
part './widgets/setup_root.dart';
part './widgets/Icons/notification_icon.dart';
part './widgets/Icons/my_icon.dart';
part './widgets/Buttons/application_icon_button.dart';
part './utils/search_delegate.dart';
part './utils/operation.dart';
part './utils/icons_helper.dart';
part './provider/page_state.dart';
part './provider/setup_provider.dart';
part './widgets/Buttons/search_bar_button.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();
final Dialog dialog = Dialog();
final Pages pages = Pages();
final API api = API();
final RowsAndColumns rowsAndColumns = RowsAndColumns();
final Operation operation = Operation();
String currentUrl = '';
int? perPage = 25;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<API>(create: (context) => API()),
        ChangeNotifierProvider<PageState>(create: (context) => PageState()),
        ChangeNotifierProvider<SetupProvider>(
            create: (context) => SetupProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 17),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          //colorSchemeSeed: Colors.grey[50],
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          'addSetup': (context) => const AddSetupScreen(),
          '/iam': (_) => const IAM(),
          '/profile': (_) => const Profile(),
          '/auth': (_) => const Auth(),
          '/employment': (_) => const Employment(),
          '/jobs': (_) => const Jobs(),
          '/hrms': (_) => const HRMS(),
          '/training': (_) => const Training(),
          '/setup': (context) => const Setup(),
          '/leave': (_) => const Leave(),
          '/apps' :(_) => const ApplicationsRoute(),
        },
        home: FutureBuilder(
            future: storage.read(key: 'token'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                debugPrint("Your token is : ${snapshot.data}");
                return const DashBoard();
              } else if (snapshot.data == null &&
                  snapshot.connectionState == ConnectionState.done) {
                return const LoginScreen();
              } else if (snapshot.hasError) {
                return Scaffold(
                  appBar: AppBar(),
                  body: const Expanded(
                      child: Center(
                    child: Txt(
                      text: 'Oops! Something went wrong',
                      fontSize: 21,
                    ),
                  )),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
