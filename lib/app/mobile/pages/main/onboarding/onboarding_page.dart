import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howbadami/core/firebase/auth_service.dart';
import 'package:howbadami/core/constants/words.dart';
import 'package:howbadami/core/notifiers/notifiers.dart';
import 'package:howbadami/app/scaffolds/app_bottom_bar_buttons.dart';
import 'package:howbadami/app/mobile/pages/main/login_page.dart';
import 'package:howbadami/app/widgets/button_widget.dart';
import 'package:howbadami/core/theme/app_text_styles.dart';
import 'package:lottie/lottie.dart';

TextEditingController controllerPw = TextEditingController();
TextEditingController controllerEm = TextEditingController();

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage = 'Error message';

  void register() async {
    try {
      await authService.value.createAccount(
        email: controllerEm.text,
        password: controllerPw.text,
      );
      AppData.isAuthConnected.value = true;
      popPage();
    } on FirebaseAuthException catch (e) {
      // e.code contains the Firebase error code (e.g. 'invalid-email', 'weak-password')
      setState(() {
        errorMessage = '${e.code}: ${e.message ?? 'Unknown error'}';
      });
    } catch (e, st) {
      // Fallback for any other exception
      setState(() {
        errorMessage = 'Unexpected error: $e';
      });
      // Optional: print stack trace to help debugging
      debugPrintStack(label: 'register error', stackTrace: st);
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(title: Text("register here")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/Ancient Man.json', height: 200),
                SizedBox(height: 50),
                const Text(
                  Words.register,
                  style: AppTextStyles.descriptionText,
                ),
                const SizedBox(height: 20.0),
                const Text('🔑', style: AppTextStyles.icons),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerEm,
                          decoration: const InputDecoration(
                            labelText: Words.email,
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return Words.enterSomething;
                            }
                            if (value.trim().isEmpty) {
                              return Words.enterSomething;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controllerPw,
                          decoration: const InputDecoration(
                            labelText: Words.password,
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return Words.enterSomething;
                            }
                            if (value.trim().isEmpty) {
                              return Words.enterSomething;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(errorMessage, style: TextStyle(color: Colors.red)),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: Words.register);
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('default'),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      buttons: [
        ButtonWidget(
          isFilled: true,
          label: Words.register,
          callback: () {
            if (_formKey.currentState!.validate()) {
              register();
            }
          },
        ),
      ],
    );
  }
}
