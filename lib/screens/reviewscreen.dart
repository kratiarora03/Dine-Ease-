import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave a Review'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'How was your experience?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle submit action
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.orange[100], // Text color
                side: BorderSide(color: Colors.deepOrange[800]!, width: 2), // Border color
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
