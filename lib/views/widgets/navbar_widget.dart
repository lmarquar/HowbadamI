import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:howbadami/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Socials',
            ),
            NavigationDestination(icon: Icon(Elusive.leaf), label: 'Search'),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
