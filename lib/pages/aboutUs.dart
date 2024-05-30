import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to DineEase!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'DineEase is your go-to app for finding and exploring the best restaurants in town. Whether you are looking for a cozy cafe, a fancy dining experience, or a quick bite, DineEase has you covered. Our mission is to make dining out a seamless and enjoyable experience for everyone.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our team is dedicated to providing you with the most accurate and up-to-date information about restaurants, including reviews, menus, and special offers. We hope you enjoy using DineEase as much as we enjoyed creating it for you!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Meet the Developers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are a team of dedicated individuals who have put in a lot of effort to make DineEase possible. As students of FS-B, under the expert guidance of our teacher Dr. Aarti Sangwan, we have developed a dine-in app named DineEase as our major project for the subject Mobile Application Development (M.A.D.). This app has been created using the Dart language on the Flutter framework, utilizing VS Code as our software platform and Firebase for authentication.\n\nWe would like to extend our heartfelt gratitude to Dr. Aarti Sangwan for her invaluable support and mentorship throughout this project.\n\nHere is a little bit about each of us:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            DeveloperContainer(
              name: 'Aditya Arora',
              rollNumber: '21csu357',
              email: 'aditya21csu357@ncuindia.edu',
              photoUrl: 'images/aditya.jpg', // Asset image path
              roleDescription:
                  'Aditya is responsible for the making the Login/SignUp page, adding Google SignIn functionality in the page, adding the forgot password functionality, adding authentication using Firebase and connecting Firebase to the code, intrgrating his code with the final code given by Sahil, Krati, Arushi and Bhavay, futher added functionaltiy like About Us in the drawer function, fetching user data from firebase and showing it on profile and finally adding the logout functionality and summing up the code.  .',
            ),
            const SizedBox(height: 10),
            DeveloperContainer(
              name: 'Krati Arora',
              rollNumber: '21csu361',
              email: 'krati21csu361@ncuindia.edu',
              photoUrl: 'images/krati.png', // Asset image path
              roleDescription:
                  "Krati is responsible for the making the table Reservation at restaurants with 24 hr date-wise scheduling and integrating her code with Sahil and Arushi's code.",
            ),
            const SizedBox(height: 10),
            DeveloperContainer(
              name: 'Sahil',
              rollNumber: '21csu376',
              email: 'sahil21csu376@ncuindia.edu',
              photoUrl: 'images/sahil.png', // Asset image path
              roleDescription:
                  'Sahil is responsible for the making the Google Maps location for all the restaurants and user profile.',
            ),
            const SizedBox(height: 10),
            DeveloperContainer(
              name: 'Arushi Sharma',
              rollNumber: '21csu518',
              email: 'arushi21csu518@ncuindia.edu',
              photoUrl: 'images/arushi.png', // Asset image path
              roleDescription:
                  "Arushi is responsible for the making the Home screen, different restaurant screens, Review screen and integrating her code with Bhavay's code.",
            ),
            const SizedBox(height: 10),
            DeveloperContainer(
              name: 'Bhavay Makkar',
              rollNumber: '21csu520',
              email: 'bhavay21csu520@ncuindia.edu',
              photoUrl: 'images/bhavay.png', // Asset image path
              roleDescription:
                  "Bhavay is responsible for the making the search functionality, app drawer and integrating his code with Sahil's code.",
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperContainer extends StatelessWidget {
  final String name;
  final String rollNumber;
  final String email;
  final String photoUrl;
  final String roleDescription;

  DeveloperContainer({
    required this.name,
    required this.rollNumber,
    required this.email,
    required this.photoUrl,
    required this.roleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(photoUrl),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Roll Number: $rollNumber',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  roleDescription,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
