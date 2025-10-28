import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/login_page.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/Grafico.json'),
                FittedBox(
                  child: Text(
                    'Welcome to Leons Sandbox!',
                    style: TextStyle(
                      fontSize: 500.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
