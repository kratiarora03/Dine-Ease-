import 'package:flutter/material.dart';
import 'package:fooddelivery/Cafe.dart';
import '/models/restaurant.dart'; // Import your Restaurant model
import 'package:fooddelivery/screens/reviewscreen.dart';
import 'package:fooddelivery/widgets/guestcounter.dart';
import 'package:fooddelivery/pages/map_page.dart'; // Import MapPage

class DanachogaRestaurantScreen extends StatelessWidget {
  final Restaurant restaurant; // Pass the Restaurant object to the screen

  const DanachogaRestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image with Icons
            Stack(
              children: [
                Container(
                  height: 300, // Adjust height as needed
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/dana1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 32),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search,
                              size: 32, color: Colors.white),
                          onPressed: () {
                            // Handle search action
                          },
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.logout,
                              size: 32, color: Colors.white),
                          onPressed: () {
                            // Handle favorites action
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Restaurant Name and Description
                    const Text(
                      'Dana Choga',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'North Indian Restaurant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Ratings, Timings, and Location in a Box
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 215, 175),
                        border: Border.all(
                            color: Colors.deepOrange[800]!, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Rating Stars
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.star_border, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                '(4.1 Reviews)',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Timings
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                '10am - 11pm',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Location
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.orange),
                              const SizedBox(width: 8),
                              Text(
                                'Location: ${restaurant.address}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Buttons in a Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Make a Reservation Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GuestCounterPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.orange[100], // Text color
                            side: BorderSide(
                                color: Colors.deepOrange[800]!,
                                width: 2), // Border color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Make a Reservation',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Reviews Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewScreen()),
                            );
                            // Handle Reviews action
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.orange[100], // Text color
                            side: BorderSide(
                                color: Colors.deepOrange[800]!,
                                width: 2), // Border color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage(
                                        cafe: dummyCafes.firstWhere(
                                          (cafe) =>
                                              cafe.name == restaurant.name,
                                        ),
                                        restaurant: restaurant,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.orange[100], // Text color
                            side: BorderSide(
                                color: Colors.deepOrange[800]!,
                                width: 2), // Border color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Menu Heading
                    const Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Menu Images in a Vertical Line
                    Column(
                      children: [
                        Image.asset('images/danamenu.jpg'),
                        const SizedBox(
                          height: 16,
                        ),
                        Image.asset('images/danamenu1.jpg'),
                        const SizedBox(height: 16),
                        // Add more images as needed
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
