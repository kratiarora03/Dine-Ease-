import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/login/Services/authentication.dart';
import 'package:fooddelivery/login/Services/google_auth';
import 'package:fooddelivery/login/Widget/button.dart';

// import '../Services/authentication.dart';
import 'login.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulation\nYou have successfully Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            MyButtons(
                onTap: () async {
                  await AuthMethod().signOut();
                  await FirebaseServices().googleSignOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                text: "Log Out"),
            Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            Text("${FirebaseAuth.instance.currentUser!.displayName}")
          ],
        ),
      ),
    );
  }
}
