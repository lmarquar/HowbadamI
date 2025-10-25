import 'package:flutter/material.dart';
import 'package:howbadami/views/widget_tree.dart';

TextEditingController controllerPw = TextEditingController();
TextEditingController controllerEm = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEm = TextEditingController(text: 'Hello');
  TextEditingController controllerPw = TextEditingController(text: '123');
  String confirmedEmail = 'Hello';
  String confirmedPassword = '123';

  @override
  void dispose() {
    controllerPw.dispose();
    controllerEm.dispose();
    super.dispose();
  }

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
                //  Lottie.asset('assets/lotties/Sustainable.json', height: 200),
                TextField(
                  controller: controllerEm,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controllerPw,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    onLoginPressed();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmedEmail == controllerEm.text &&
        confirmedPassword == controllerPw.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}
