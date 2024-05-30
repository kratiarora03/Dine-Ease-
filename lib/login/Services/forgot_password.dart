import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/login/Widget/snackbar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the dialog box function when "Forgot Password?" text is tapped
        myDialogBox(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Align(
          alignment: FractionalOffset.centerRight,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  // Your existing dialog box function remains unchanged
  void myDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      "Forgot Your Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter the Email",
                      hintText: "eg abc@gmail.com"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    await auth
                        .sendPasswordResetEmail(
                      email: emailController.text,
                    )
                        .then((value) {
                      showSnackBar(
                        context,
                        "We have sent you the reset password link to your Email ID. Please check your mail.",
                      );
                    }).onError((error, StackTrace) {
                      showSnackBar(context, error.toString());
                    });
                    Navigator.pop(context);
                    emailController.clear();
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
