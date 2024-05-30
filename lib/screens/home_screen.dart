import 'package:flutter/material.dart';
import 'package:fooddelivery/login/Screen/login.dart';
import 'package:fooddelivery/login/Services/authentication.dart';
import 'package:fooddelivery/login/Services/google_auth';
import 'package:fooddelivery/pages/aboutUs.dart';
import 'package:fooddelivery/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/models/restaurant.dart';
import '/screens/restaurant_routes.dart'; // Import the mapping file

class HomeScreen extends StatefulWidget {
  final List<Restaurant> restaurants;

  const HomeScreen({Key? key, required this.restaurants}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Restaurant> _filteredRestaurants = [];
  User? user;

  @override
  void initState() {
    super.initState();
    _filteredRestaurants = widget.restaurants;
    user = FirebaseAuth.instance.currentUser;
  }

  void _filterRestaurants(String query) {
    final filtered = widget.restaurants.where((restaurant) {
      final nameLower = restaurant.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      _filteredRestaurants = filtered;
    });
  }

  void _navigateToRestaurantDetail(Restaurant restaurant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => getRestaurantScreen(restaurant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'DineEase',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,
        actions: [
          if (user != null && user!.photoURL != null)
            IconButton(
              icon: CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: Image.network(
                    user!.photoURL!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'images/user.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
        ],
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Explore Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Image(
                    image: AssetImage('assets/images/login.png'),
                    height: 98,
                    width: 98,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.deepOrange),
              title: const Text('Home',
                  style: TextStyle(color: Colors.deepOrange)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.account_circle, color: Colors.deepOrange),
              title: const Text('Profile',
                  style: TextStyle(color: Colors.deepOrange)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.deepOrange),
              title: const Text('About Us',
                  style: TextStyle(color: Colors.deepOrange)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepOrange),
              title: const Text('Logout',
                  style: TextStyle(color: Colors.deepOrange)),
              onTap: () async {
                await AuthMethod().signOut();
                await FirebaseServices().googleSignOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterRestaurants,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 0.8,
                    color: Colors.deepOrange,
                  ),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.deepOrange),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _filterRestaurants('');
                  },
                  icon: const Icon(Icons.clear, color: Colors.deepOrange),
                ),
                hintText: 'Search Restaurants',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Nearby Restaurants',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredRestaurants.length,
            itemBuilder: (context, index) {
              final restaurant = _filteredRestaurants[index];
              return GestureDetector(
                onTap: () {
                  _navigateToRestaurantDetail(restaurant);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 1.0, color: Colors.grey[200]!),
                  ),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Hero(
                          tag: restaurant.imageUrl,
                          child: Image.asset(
                            restaurant.imageUrl,
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                restaurant.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                restaurant.address,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
