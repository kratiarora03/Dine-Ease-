import 'package:flutter/material.dart';
import '/data/data.dart';
import '/models/restaurant.dart';
import 'package:fooddelivery/screens/restaurants_screen/citrus.dart';
import 'package:fooddelivery/screens/restaurants_screen/danachoga.dart';
import 'package:fooddelivery/screens/restaurants_screen/punjab.dart';
import 'package:fooddelivery/screens/restaurants_screen/cafeg.dart';
import 'package:fooddelivery/screens/restaurants_screen/soul.dart';
import 'package:fooddelivery/screens/restaurants_screen/ivycafe.dart';
import 'package:fooddelivery/screens/restaurants_screen/kitchen.dart';
import 'package:fooddelivery/screens/restaurants_screen/threesixtyone.dart';
import 'package:fooddelivery/screens/restaurants_screen/guftagu.dart';
import 'package:fooddelivery/screens/restaurants_screen/latest.dart';
import '/widgets/rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import CachedNetworkImage

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({Key? key}) : super(key: key);

  Widget _buildNearbyRestaurants(BuildContext context) {
    List<Widget> restaurantList = [];
    for (Restaurant thisRestaurant in restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            if (thisRestaurant.id == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        CitrusRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        DanachogaRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        SoulRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        LatestRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 5) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        PunjabRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 6) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        IvyRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 7) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        ThreesixtyRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 8) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        CafegRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 9) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        KitchenRestaurantScreen(restaurant: thisRestaurant)),
              );
            } else if (thisRestaurant.id == 10) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        GuftaguRestaurantScreen(restaurant: thisRestaurant)),
              );
            }
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
                    tag: thisRestaurant.imageUrl,
                    child: CachedNetworkImage(
                      // Use CachedNetworkImage for cached loading
                      imageUrl: thisRestaurant.imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(), // Placeholder widget while loading
                      errorWidget: (context, url, error) => Icon(
                          Icons.error), // Error widget if image fails to load
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
                          thisRestaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        RatingStars(thisRestaurant.rating),
                        const SizedBox(height: 4.0),
                        Text(
                          thisRestaurant.address,
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
        ),
      );
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        _buildNearbyRestaurants(context),
      ],
    );
  }
}
