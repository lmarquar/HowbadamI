import 'package:flutter/material.dart';
import 'package:howbadami/services/auth_service.dart'; // Your AuthService
import 'package:howbadami/pages/home.dart'; // Your Home screen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ... your other login widgets (email/password) ...

            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.login), // Or a Google logo asset
              label: const Text('Sign in with Google'),
              onPressed: () async {
                final userCredential = await authService.signInWithGoogle(context: context);
                if (userCredential != null && userCredential.user != null) {
                  // Navigate to Home screen or dashboard
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  // Handle sign-in failure (message already shown by AuthService)
                  print('Google Sign-In failed or was cancelled.');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Or Google's brand color
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}