import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/profile/profile_page.dart';
import 'package:howbadami/core/constants/words.dart';
import 'package:howbadami/lib/button_widgets_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage();
                      },
                    ),
                  );
                },
                child: Text(Words.myProfile),
              ),
              Divider(color: Colors.teal, thickness: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonWidgetsPage(title: "Testing Widgets here");
                      },
                    ),
                  );
                },
                child: Text('Developer Sandbox'),
              ),
              Divider(color: Colors.teal, thickness: 5),
            ],
          ),
        ),
      ),
    );
  }
}
