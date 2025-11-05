import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/reset_password_page.dart';
import 'package:howbadami/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:howbadami/app/mobile/widgets/button_widget.dart';
import 'package:howbadami/core/constants/words.dart';
import 'package:howbadami/core/firebase/auth_service.dart';
import 'package:howbadami/core/functions/utils.dart';
import 'package:howbadami/core/theme/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEm = TextEditingController(text: 'Hello');
  TextEditingController controllerPw = TextEditingController(text: '123');
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerPw.dispose();
    controllerEm.dispose();
    super.dispose();
  }

  void signIn() async {
    try {
      await authService.value.signIn(
        email: controllerEm.text,
        password: controllerPw.text,
      );
      Utils.showSuccessSnackBar('successfully logged in!');
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message ?? "This is not working. Please try again.";
      Utils.showErrorSnackBar(errorMessage);
    }
    popPage();
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(Words.signIn, style: AppTextStyles.xxlBold),
              const SizedBox(height: 20.0),
              const Text('🔑', style: AppTextStyles.icons),
              const SizedBox(height: 50),
              Form(
                key: formKey,
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
                        style: AppTextStyles.m,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ResetPasswordPage(
                                    email: controllerEm.text,
                                  );
                                },
                              ),
                            );
                          },
                          child: const Text(Words.resetPassword),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      buttons: [
        ButtonWidget(
          isFilled: true,
          label: Words.signIn,
          callback: () {
            if (formKey.currentState!.validate()) {
              signIn();
            }
          },
        ),
      ],
    );
  }
}
