import 'package:flutter/material.dart';
import 'package:fooddelivery/Cafe.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/screens/reviewscreen.dart';
import 'package:fooddelivery/widgets/guestcounter.dart';
import 'package:fooddelivery/pages/map_page.dart'; // Import MapPage
// Import Cafe class and dummyCafes list

class CitrusRestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const CitrusRestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(restaurant.imageUrl),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Cheerful, modern bistro offering an array of Indian and global dishes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                '11am - 11pm',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
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
                              // ElevatedButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => MapPage(
                              //           cafe: dummyCafes.firstWhere(
                              //             (cafe) =>
                              //                 cafe.name == restaurant.name,
                              //           ),
                              //           restaurant: restaurant,
                              //         ),
                              //       ),
                              //     );
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     foregroundColor: Colors.black,
                              //     backgroundColor: Colors.orange[100],
                              //     side: BorderSide(
                              //       color: Colors.deepOrange[800]!,
                              //       width: 2,
                              //     ),
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 24, vertical: 12),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //   ),
                              //   child: const Text('Go to Map'),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            backgroundColor: Colors
                                .orange[100], // Background color of the button
                            side: BorderSide(
                                color: Colors.deepOrange[
                                    800]!, // Border color of the button
                                width: 2), // Border width of the button
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Border radius of the button
                            ),
                          ),
                          child: const Text(
                            'Make a Reservation', // Text of the button
                            style: TextStyle(
                              fontSize: 16, // Font size of the text
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Colors.black, // Text color of the button
                            backgroundColor: Colors
                                .orange[100], // Background color of the button
                            side: BorderSide(
                                color: Colors.deepOrange[
                                    800]!, // Border color of the button
                                width: 2), // Border width of the button
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Border radius of the button
                            ),
                          ),
                          child: const Text(
                            'Reviews', // Text of the button
                            style: TextStyle(
                              fontSize: 16, // Font size of the text
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
                            backgroundColor: Colors.orange[100],
                            side: BorderSide(
                                color: Colors.deepOrange[800]!, width: 2),
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
                    Column(
                      children: [
                        Image.asset('images/citrusmenu.jpg'),
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
