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
|![Home](https://github.com/user-attachments/assets/321a3305-3721-4f30-90d4-0047350dfd67)| ![Cart](https://github.com/user-attachments/assets/25579edb-5dae-4320-ac69-fd375e052a04) |![Settings](https://github.com/user-attachments/assets/af495376-5b52-4b42-a2bb-59baa6e29b37)| ![Admin](https://github.com/user-attachments/assets/7f5f5d1e-a023-4fed-92f4-fbab0861e4df)|



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
