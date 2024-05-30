// In search_screen.dart
import 'package:flutter/material.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/screens/home_screen.dart';
import 'package:fooddelivery/screens/restaurants_screen/cafeg.dart';
import 'package:fooddelivery/screens/restaurants_screen/citrus.dart';
import 'package:fooddelivery/screens/restaurants_screen/danachoga.dart';
import 'package:fooddelivery/screens/restaurants_screen/guftagu.dart';
import 'package:fooddelivery/screens/restaurants_screen/ivycafe.dart';
import 'package:fooddelivery/screens/restaurants_screen/kitchen.dart';
import 'package:fooddelivery/screens/restaurants_screen/latest.dart';
import 'package:fooddelivery/screens/restaurants_screen/punjab.dart';
import 'package:fooddelivery/screens/restaurants_screen/soul.dart';
import 'package:fooddelivery/screens/restaurants_screen/threesixtyone.dart'; // Import restaurant 1 screen
// Import other restaurant screens similarly for all 10 restaurants

class SearchScreen extends StatefulWidget {
  final List<Restaurant> restaurants;

  const SearchScreen({Key? key, required this.restaurants}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Restaurant> _filteredRestaurants = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredRestaurants = widget.restaurants;
    _searchController.addListener(() {
      setState(() {
        _filteredRestaurants = widget.restaurants
            .where((restaurant) => restaurant.name.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToRestaurantDetail(Restaurant restaurant) {
    // Navigate to the respective restaurant screen based on the selected restaurant
    switch (restaurant.id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CitrusRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DanachogaRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SoulRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LatestRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PunjabRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IvyRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 7:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThreesixtyRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 8:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CafegRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 9:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KitchenRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
        case 10:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GuftaguRestaurantScreen(restaurant: restaurant),
          ),
        );
        break;
      // Add cases for other restaurants similarly
      default:
        // Navigate to the default detail screen if no specific screen is found
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(restaurants: restaurants),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurants'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
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
                  },
                  icon: const Icon(Icons.clear, color: Colors.deepOrange),
                ),
                hintText: 'Search Restaurants',
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredRestaurants.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredRestaurants[index].name),
                    onTap: () => _navigateToRestaurantDetail(_filteredRestaurants[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
