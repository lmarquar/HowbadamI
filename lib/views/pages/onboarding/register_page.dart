import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/widgets/bottom_stepper_widget.dart';
import 'package:howbadami/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:howbadami/app/mobile/widgets/button_widget.dart';
import 'package:howbadami/auth_service.dart';
import 'package:howbadami/core/theme/app_text_styles.dart';
import 'package:howbadami/views/pages/welcome_page.dart';
import '../../../../../../core/constants/words.dart';
import '../../../../../../core/notifiers/notifiers.dart';
import '../../../../../../core/routes/page_route_return.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = 'Error message';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void register() async {
    try {
      await authService.value.createAccount(
        email: controllerEmail.text,
        password: controllerPassword.text,
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
      appBar: AppBar(
        leading: ValueListenableBuilder(
          valueListenable: AppData.onboardingCurrentIndexNotifier,
          builder: (context, currentIndex, child) {
            return IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  pageRouteReturn(previousPage: WelcomePage()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            );
          },
        ),
        title: const Text(Words.flutterPro),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, double.minPositive),
          child: BottomStepperWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(Words.register, style: AppTextStyles.xxlBold),
              const SizedBox(height: 20.0),
              const Text('🔑', style: AppTextStyles.icons),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerEmail,
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
                        controller: controllerPassword,
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
          label: Words.register,
          callback: () {
            if (formKey.currentState!.validate()) {
              register();
            }
          },
        ),
      ],
    );
  }
}
