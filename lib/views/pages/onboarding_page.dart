import 'package:flutter/material.dart';
import 'package:howbadami/data/constants.dart';
import 'package:howbadami/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

TextEditingController controllerPw = TextEditingController();
TextEditingController controllerEm = TextEditingController();

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/Ancient Man.json', height: 200),
                SizedBox(height: 50),
                Text(
                  'I am noob and do not toot',
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Register');
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
    );
  }
}
