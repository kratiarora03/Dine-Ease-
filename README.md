# Dine-ease

Dine-ease is a cross-platform mobile application developed using Flutter. It helps users discover nearby restaurants, browse their menus, read reviews, make reservations, and manage their profiles through secure login functionalities. By leveraging location services and Google Maps, Dine-ease provides enhanced searchability of dining options. Efficient state management using the Provider package ensures responsive and seamless interactions. Additionally, Firebase is integrated for user authentication and secure data storage.

## Features

- **Restaurant Discovery**: Discover nearby restaurants using location services.
- **Google Maps Integration**: Visualize restaurant locations on a map.
- **Menu Browsing**: View menus of listed restaurants.
- **Reviews and Ratings**: Read aggregated reviews and ratings for each restaurant.
- **Reservations**: Make reservations directly through the app (where available).
- **State Management**: Efficient state management using the Provider package.
- **Login Functionalities**: Log in using email/password or Google authentication.
- **Profile Management**: Manage profile and view reservation history.

## Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider
- **APIs**: Google Maps API, Partner APIs for reservations
- **Database**: Firebase
- **Authentication**: Firebase Authentication
- **Development Tools**: Android Studio, Xcode

## Architecture

The application follows a modular architecture, separating concerns into distinct layers:
1. **UI Layer**: Contains all the widgets and UI components.
2. **Data Layer**: Manages data retrieval, storage, and caching.
3. **Business Logic Layer**: Contains the business logic and state management using Provider.
4. **Service Layer**: Handles API calls and integration with external services.

## Key Components

1. **Location Services**: Obtain the user’s current position using the geolocator package to find nearby restaurants.
2. **Google Maps Integration**: Integrate Google Maps using the google_maps_flutter package for map-based search capabilities.
3. **Menu and Reviews**: Fetch and display menu items and reviews from restaurant databases.
4. **Reservation System**: Integrate with partner APIs to enable in-app reservations.
5. **State Management with Provider**: Manage application state efficiently to ensure a smooth user experience.
6. **Authentication and Profile Management**: Use Firebase Authentication for secure login and store user data in Firebase.

## User Interface

The user interface is designed to be intuitive and user-friendly. Key screens include:
- **Home Screen**: Displays a list of nearby restaurants and a map view.
- **Restaurant Details Screen**: Shows detailed information about a selected restaurant, including menu, reviews, and reservation options.
- **Map Screen**: Provides a map view with markers for nearby restaurants.
- **Profile Screen**: Allows users to manage their profile, view their reservation history, and update their login credentials.

## Testing and Quality Assurance

Dine-ease undergoes rigorous testing to ensure quality and performance, including:
- **Unit Testing**: Ensures individual components and functions work as expected.
- **Integration Testing**: Validates the interaction between different parts of the application.
- **UI Testing**: Checks the user interface for usability and responsiveness.
- **Security Testing**: Ensures user data and authentication mechanisms are secure.

Automated tests are written using Flutter’s testing framework to maintain code quality and catch issues early in the development process.

## Conclusion

Dine-ease combines Flutter’s cross-platform capabilities with powerful features such as location services, Google Maps integration, menu browsing, reviews, reservations, and secure login functionalities. Efficient state management using Provider and Firebase integration for user authentication ensures that the application is responsive and user-friendly. This project demonstrates the potential of Flutter in building sophisticated, cross-platform mobile applications that enhance user experiences in the restaurant discovery domain.

## Screenshots

### FireBase Console
![Home Screen](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/78ae0cb9-fd76-434c-86a9-3cdaee2a0d5f)

### Login Page
![Restaurant Details](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/9e120963-48dd-4d2e-b427-b6e9e94644ad)

### Continue With Google
![Map View](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/e1773031-ec04-4e57-8504-45e2fa259267)

### Profile Screen
![Profile Screen](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/dc64a5cb-aada-4dea-a8d0-06ffb8836bfc)

### Home Screen
![Menu Screen](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/5538ca35-bc54-4649-9ca7-1f17fb98e8e1)

### Cafe Details
![Reservations Screen](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/ce01b2b5-1375-47f2-abc5-c5e1cf1221d2)

### Menu Page
![Search Results](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/7f105fe9-e7c8-4381-a514-ee6be975d874)

### Map Screen 
![Another Profile Screen](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/413a51af-7239-45a1-94a1-99969f596fc8)

### Table Reservation 
![Additional View](https://github.com/kratiarora03/Dine-Ease-/assets/106904755/bab0ee01-94d5-47a9-a68b-ffd264a7c628)

