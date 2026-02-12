import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/main_home_screen.dart';
import 'login_screen.dart';

/// Auth wrapper - checks if user is logged in
/// Shows login screen if not authenticated, home screen if authenticated
/// Implements persistent login state management
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading splash while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo/icon
                  Icon(
                    Icons.eco,
                    size: 80,
                    color: Color(0xFF00C853),
                  ),
                  SizedBox(height: 24),
                  // App name
                  Text(
                    'Plant Care Pulse',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00C853),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Loading indicator
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00C853)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Checking session...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Show home if user is logged in (persistent session)
        if (snapshot.hasData) {
          return const MainHomeScreen();
        }

        // Show login if user is not logged in
        return const LoginScreen();
      },
    );
  }
}
