import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/firebase_options.dart';
import 'login/Screen/login.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong!'));
        } else {
          final user = snapshot.data;
          if (user != null) {
            // User is authenticated, but data is not yet loaded.
            // You might want to add additional checks here based on your app logic.
            if (restaurants != null) {
              return HomeScreen(restaurants: restaurants!);
            } else {
              // Data is loading, show a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          } else {
            // User is not authenticated, show the login screen.
            return LoginScreen();
          }
        }
      },
    );
  }
}
