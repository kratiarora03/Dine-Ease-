import 'package:flutter/material.dart';
import '/models/restaurant.dart';
import 'package:fooddelivery/screens/restaurants_screen/citrus.dart';
import 'package:fooddelivery/screens/restaurants_screen/cafeg.dart';
import 'package:fooddelivery/screens/restaurants_screen/danachoga.dart';
import 'package:fooddelivery/screens/restaurants_screen/ivycafe.dart';
import 'package:fooddelivery/screens/restaurants_screen/kitchen.dart';
import 'package:fooddelivery/screens/restaurants_screen/latest.dart';
import 'package:fooddelivery/screens/restaurants_screen/punjab.dart';
import 'package:fooddelivery/screens/restaurants_screen/soul.dart';
import 'package:fooddelivery/screens/restaurants_screen/threesixtyone.dart';
import 'package:fooddelivery/screens/restaurants_screen/guftagu.dart';

// Import other restaurant screens here

// Add a function that returns the respective screen based on restaurant name
Widget getRestaurantScreen(Restaurant restaurant) {
  switch (restaurant.name) {
    case 'Citrus Cafe':
      return CitrusRestaurantScreen(restaurant: restaurant);
    case 'Dana Choga':
      return DanachogaRestaurantScreen(restaurant: restaurant);
    case 'Cafe By Soul':
      return SoulRestaurantScreen(restaurant: restaurant);
    case 'Latest Recipes':
      return LatestRestaurantScreen(restaurant: restaurant);
    case 'Punjab Grill':
      return PunjabRestaurantScreen(restaurant: restaurant);
    case 'IVY Restaurant':
      return IvyRestaurantScreen(restaurant: restaurant);
    case 'Threesixtyone':
      return ThreesixtyRestaurantScreen(restaurant: restaurant);
    case 'Cafe G':
      return CafegRestaurantScreen(restaurant: restaurant);
    case 'Kitchen District':
      return KitchenRestaurantScreen(restaurant: restaurant);
    case 'Guftagu':
      return GuftaguRestaurantScreen(restaurant: restaurant);
    // Add other cases here if needed
    default:
      return const Center(child: Text('Restaurant not found'));
  }
}
