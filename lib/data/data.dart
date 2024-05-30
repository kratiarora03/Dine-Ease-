
import '/models/restaurant.dart';


// Food
// final _burrito = Food(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
// final _steak = Food(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);
// final _pasta = Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
// final _ramen = Food(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
// final _pancakes = Food(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
// final _burger = Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 14.99);
// final _pizza = Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99);
// final _salmon = Food(imageUrl: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 12.99);

// Restaurants 
final _restaurant0 = Restaurant(
  id: 1,
  imageUrl: 'assets/images/citrus.jpg',
  name: 'Citrus Cafe',
  address: 'Lemon Tree Premier, Ground Floor, Leisure Valley, Sector 29, Gurgaon',
  rating: 4,
  // menu: [_burrito, _steak, _pasta, _ramen, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant1 = Restaurant(
  id: 2,
  imageUrl: 'assets/images/dana.jpg',
  name: 'Dana Choga',
  address: 'Shop no 7 & 8, Old Delhi Gurgaon Road, Atul Kataria Chowk, Sector 14, Gurgaon ',
  rating: 4,
  // menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
);
final _restaurant2 = Restaurant(
  id: 3,
  imageUrl: 'assets/images/soul.jpg',
  name: 'Cafe By Soul',
  address: 'B-11/1, Ashoka Cresent Marg, DLF Phase 1, Sector 26A, Gurgaon',
  rating: 4,
  // menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant3 = Restaurant(
  id: 4,
  imageUrl: 'assets/images/latest.jpg',
  name: 'Latest Recipes',
  address: 'Mehrauli-Gurgaon Rd, Sikanderpur, Sector 26, Gurgaon',
  rating: 4,
  // menu: [_burrito, _steak, _burger, _pizza, _salmon],
);
final _restaurant4 = Restaurant(
  id: 5,
  imageUrl: 'assets/images/punjab.jpg',
  name: 'Punjab Grill',
  address: 'Level 3, Ambience Mall, Golf Dr, Ambience Island, DLF Phase 3, Sector 24, Gurgaon',
  rating: 5,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);
final _restaurant5 = Restaurant(
  id: 6,
  imageUrl: 'assets/images/ivy.jpg',
  name: 'IVY Restaurant',
  address: 'Baani Square Sector 50 D-89-90 Ground Floor, Sector 50, Gurgaon',
  rating: 4,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);
final _restaurant6 = Restaurant(
  id: 7,
  imageUrl: 'assets/images/361cafe.jpg',
  name: 'Threesixtyone',
  address: 'The Oberio, 443, Udyog Vihar Phase Rd, Phase V, Sector 19, Gurgaon',
  rating: 5,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);
final _restaurant7 = Restaurant(
  id: 8,
  imageUrl: 'assets/images/cafeg.jpg',
  name: 'Cafe G',
  address: 'Sector 29 Opposite Signature Towers, Gurgaon',
  rating: 4,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);
final _restaurant8 = Restaurant(
  id: 9,
  imageUrl: 'assets/images/kitchen.jpg',
  name: 'Kitchen District',
  address: 'Find Dining Food Avenue, Hyatt Regency, 1st Floor, Sector 83, Gurgaon',
  rating: 4,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);
final _restaurant9 = Restaurant(
  id: 10,
  imageUrl: 'assets/images/guftagu.png',
  name: 'Guftagu',
  address: 'Opposite DLF City Court, Main Road & 34 Main Road, opposite Pillar No 33, DLF Phase 2, Gurgaon',
  rating: 3,
  // menu: [_burrito, _ramen, _pancakes, _salmon],
);


final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
  _restaurant5,
  _restaurant6,
  _restaurant7,
  _restaurant8,
  _restaurant9,
];

// User
// final currentUser = User(
//   name: 'Rebecca',
//   orders: [
//     Order(
//       date: 'Nov 10, 2019',
//       food: _steak,
//       restaurant: _restaurant2,
//       quantity: 1,
//     ),
//     Order(
//       date: 'Nov 8, 2019',
//       food: _ramen,
//       restaurant: _restaurant0,
//       quantity: 3,
//     ),
//     Order(
//       date: 'Nov 5, 2019',
//       food: _burrito,
//       restaurant: _restaurant1,
//       quantity: 2,
//     ),
//     Order(
//       date: 'Nov 2, 2019',
//       food: _salmon,
//       restaurant: _restaurant3,
//       quantity: 1,
//     ),
//     Order(
//       date: 'Nov 1, 2019',
//       food: _pancakes,
//       restaurant: _restaurant4,
//       quantity: 1,
//     ),
//   ],
//   cart: [
//     Order(
//       date: 'Nov 11, 2019',
//       food: _burger,
//       restaurant: _restaurant2,
//       quantity: 2,
//     ),
//     Order(
//       date: 'Nov 11, 2019',
//       food: _pasta,
//       restaurant: _restaurant2,
//       quantity: 1,
//     ),
//     Order(
//       date: 'Nov 11, 2019',
//       food: _salmon,
//       restaurant: _restaurant3,
//       quantity: 1,
//     ),
//     Order(
//       date: 'Nov 11, 2019',
//       food: _pancakes,
//       restaurant: _restaurant4,
//       quantity: 3,
//     ),
//     Order(
//       date: 'Nov 11, 2019',
//       food: _burrito,
//       restaurant: _restaurant1,
//       quantity: 2,
//     ),
//   ],
// );
