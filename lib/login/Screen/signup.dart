import 'package:flutter/material.dart';
import 'package:fooddelivery/login/Widget/button.dart';

import '../Services/authentication.dart';
import '../Widget/snackbar.dart';
import '../Widget/text_field.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethod().signupUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );

    if (res == "success") {
      setState(() {
        isLoading = false;
      });

      // Navigate to login screen after successful signup
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background GIF
          Image.network(
            "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7eedf0b8-2830-42f2-8817-fa4139ad4538/dfuh6j8-a2d875a9-0c4e-4c99-9523-88be15325786.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZWRmMGI4LTI4MzAtNDJmMi04ODE3LWZhNDEzOWFkNDUzOFwvZGZ1aDZqOC1hMmQ4NzVhOS0wYzRlLTRjOTktOTUyMy04OGJlMTUzMjU3ODYuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WUZRoF5LKBHng_4X_nCcaiiVZzyMc0RWoNIBLmUGcDE",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: height / 2.8,
                      // Empty widget to maintain space for the GIF
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      color: Colors.transparent,
                      child: TextFieldInput(
                        icon: Icons.person,
                        textEditingController: nameController,
                        hintText: 'Enter your name',
                        textInputType: TextInputType.text,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      color: Colors.transparent,
                      child: TextFieldInput(
                        icon: Icons.email,
                        textEditingController: emailController,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.text,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      color: Colors.transparent,
                      child: TextFieldInput(
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        isPass: true,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  MyButtons(onTap: signupUser, text: "Sign Up"),
                  const SizedBox(height: 10), // Reduced the gap
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
