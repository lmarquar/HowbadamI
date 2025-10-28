import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/others/app_loading_page.dart';
import 'package:howbadami/core/firebase/auth_service.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/welcome_page.dart';
import 'package:howbadami/app/mobile/pages/main/home/widget_tree.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const AppLoadingPage();
            } else if (snapshot.hasData) {
              widget = const WidgetTree();
            } else {
              widget = pageIfNotConnected ?? const WelcomePage();
            }
            return widget;
          },
        );
      },
    );
  }
}
