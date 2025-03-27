# Chocolate Shop 🍫

A Flutter-based mobile application for a chocolate store with user and admin features. Built with Firebase for authentication, Firestore for data storage, and FCM for push notifications.

## Features
- **User Features**:
  - Login/Logout with Firebase Authentication.
  - Browse chocolate products with search functionality.
  - Add/remove items to/from cart using Provider state management.
  - Simulate checkout with Firebase Cloud Messaging notifications.
  - Edit user profile (name, phone) in Settings.
- **Admin Features**:
  - Add and delete products in the admin panel (Firestore integration).
- **UI/UX**:
  - Custom reusable widgets (`CustomAppBar`, `CustomTextfields`, `CustomButton`).
  - Animated logout button with `AnimatedSwitcher`.
  - Modern design with cards, shadows, and rounded buttons.

## Screenshots
| Home Screen | Cart Screen | Settings Screen | Admin Panel |
|-------------|-------------|-----------------|-------------|
|![Home](https://github.com/user-attachments/assets/321a3305-3721-4f30-90d4-0047350dfd67)| ![Cart](https://github.com/user-attachments/assets/25579edb-5dae-4320-ac69-fd375e052a04) |![Settings]![3](https://github.com/user-attachments/assets/8b5889f9-5808-4502-a4e6-377f6bade281)| ![Admin](https://github.com/user-attachments/assets/7f5f5d1e-a023-4fed-92f4-fbab0861e4df)|



## Tech Stack
- **Flutter**: UI and app logic.
- **Firebase**: Authentication, Firestore, Cloud Messaging.
- **Provider**: State management for cart.
- **Cloud Firestore**: Real-time product and user data storage.

## Setup
1. **Clone the repository**:
   ```bash
   git clone https://github.com/ВАШ_ЮЗЕРНЕЙМ/ChocolateShop.git
   cd ChocolateShop
2.**Install dependencies**:
  ```bash flutter pub get```
  
3.**Install dependencies:**

4.**Configure Firebase**:
- Create a Firebase project and add your google-services.json (Android) and GoogleService-Info.plist (iOS).
- Enable Authentication (Email/Password) and Firestore.
- Set up Cloud Messaging for notifications.

5.**Run the flutter app**:
 ```bash flutter run```
 
## Design
- **Colors** : Dark brown (#4A2C2A) for primary, orange (#F4A261) for accents, beige (#F5F5F5) background.
Fonts: Playfair Display (headings), Roboto (body).
- **UI**: Reusable widgets, modern cards with shadows, and smooth animations.

## Future Improvements
- Full CRUD for admin panel (edit products).
- Integration with real payment systems (e.g., Kaspi Pay).
- Order history for users.
- Firebase Storage for image uploads.

## License
MIT License - feel free to use and modify!
