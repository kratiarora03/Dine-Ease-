import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String name = FirebaseAuth.instance.currentUser?.displayName ?? "User";
  String email = FirebaseAuth.instance.currentUser?.email ?? "No Email";

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = name;
    _emailController.text = email;
    super.initState();
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    name = _nameController.text;
                    email = _emailController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String photoURL = currentUser?.photoURL ?? 'images/user.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.network(
                      photoURL,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'images/user.png',
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _editProfile,
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
