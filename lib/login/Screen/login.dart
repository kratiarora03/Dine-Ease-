import 'package:flutter/material.dart';
import 'package:fooddelivery/login/Services/forgot_password.dart';
import 'package:fooddelivery/login/Services/google_auth';
import 'package:fooddelivery/screens/home_screen.dart';
import '../Services/authentication.dart';
import '../Widget/button.dart';
import '../Widget/snackbar.dart';
import '../Widget/text_field.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // Email and password auth part
  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // Signup user using our auth method
    String res = await AuthMethod().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(
            restaurants: [],
          ),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // Show error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orange, // Changed background color to orange
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.network(
              'https://64.media.tumblr.com/851803c94d9737ef3c7011dff5d370f0/a823a47704e2100b-c3/s1280x1920/78a9771ee7e5c96825df1e5e9eb950ae303612c5.gifv', // Replace with your GIF URL
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 2.7,
                      child: Image.asset('images/login.png'),
                    ),
                    TextFieldInput(
                      icon: Icons.person,
                      textEditingController: emailController,
                      hintText: 'Enter your email',
                      textInputType: TextInputType.text,
                      fillColor: Colors.white
                          .withOpacity(0.7), // Increase transparency
                    ),
                    TextFieldInput(
                      icon: Icons.lock,
                      textEditingController: passwordController,
                      hintText: 'Enter your password',
                      textInputType: TextInputType.text,
                      isPass: true,
                      fillColor: Colors.white
                          .withOpacity(0.7), // Increase transparency
                    ),
                    const ForgotPassword(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 35),
                    //   child: Align(
                    //     alignment: FractionalOffset.centerRight,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         myDialogBox(context);
                    //         // Navigator.of(context).push(
                    //         //   MaterialPageRoute(
                    //         //     builder: (context) =>
                    //         //         const ForgotPassword(), // Navigate to reset password screen
                    //         //   ),
                    //         // );
                    //       },
                    //       child: const Text(
                    //         "Forgot Password?",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 16,
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    MyButtons(
                      onTap: loginUser,
                      text: "Log In",
                    ),
                    SizedBox(
                      height: height / 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2, // Increase thickness
                            color: Colors.white, // Change color to white
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Increase font size
                              color: Colors.white, // Change color to white
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2, // Increase thickness
                            color: Colors.white, // Change color to white
                          ),
                        ),
                      ],
                    ),
                    // For Google login
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () async {
                          await FirebaseServices().signInWithGoogle();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(
                                restaurants: [],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Image.network(
                                "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
                                height: 35,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
