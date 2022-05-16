part of 'package:crackit/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool hiddenPassword = false;

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<API>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Form(
            key: loginForm,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.logoTransparent,
                      width: double.infinity,
                      height: 270,
                    ),
                    TextFormField(
                      controller: username,
                      validator: (value) {
                        if (provider.dataError) {
                          return provider.errorMap['errorPayload']['errors']
                              ['username'];
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 16,
                          ),
                          hintText: 'username'),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (provider.dataError) {
                          return provider.errorMap['errorPayload']['errors']
                              ['password'];
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      enableSuggestions: false,
                      obscureText: hiddenPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FontAwesomeIcons.lock,
                          size: 16,
                        ),
                        hintText: 'password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              _showSnackBar('On development.');
                            },
                            child: const Txt(
                              text: 'forgot password?',
                              fullUpperCase: true,
                              textAlign: TextAlign.start,
                            ))),
                    const SizedBox(
                      height: 27,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              dialog.progress(
                                  context, 'Authenticating', 'Please wait...');
                              provider.init();
                              Map body = {
                                'username': username.text,
                                'password': password.text
                              };
                              await provider.auth(Urls.auth + '/login', body);

                              if (loginForm.currentState!.validate()) {
                                if (provider.success) {
                                  Future.delayed(Duration.zero, () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const DashBoard()));
                                  });
                                }
                              }
                              if (provider.catchError && !provider.dataError) {
                                _showSnackBar(provider.errorMessage);
                              }
                              Navigator.of(context).pop();
                            },
                            child: const Txt(text: 'Login')))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
