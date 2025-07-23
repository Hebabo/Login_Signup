# Hello World Flutter App

A clean Flutter project that demonstrates a modern login and sign-up UI, along with a dynamic home screen that fetches a list of food categories from a public API.

## ✨ Features

- Login screen with validation and SnackBar feedback
- Sign-up screen with matching clean UI
- TextFormField inputs wrapped in a reusable widget (`AppTextField`)
- Consistent color scheme using a centralized `AppColors` file
- Home screen that fetches and displays food categories from the network
- Bottom navigation bar to switch between Login, Signup, and Home screens

## 🌐 API Integration

The home screen uses a real API — [TheMealDB](https://www.themealdb.com/api.php) — to fetch and display food categories.  
Each list item includes:
- A thumbnail image
- Category title
- A brief description

> 💡 This is like a past project I did using API, I previously worked with in a JavaScript project. This time, I integrated it using Dart and the `http` package in Flutter.

## 📸 Screenshots

## Screenshots

### 🔐 Login Screen
![Login Screen](assets/images/login.png)
![Login Screen](assets/images/login_valid.png)

### 📝 Sign Up Screen
![Sign Up Screen](assets/images/signup.png)
![Sign Up Screen](assets/images/signup_valid.png)


## Getting Started

To run this project on your machine:

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd hello_world
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## 📦 Packages Used

* [`http`](https://pub.dev/packages/http) – For making API requests

## 🛠️ Folder Structure

```
lib/
├── main.dart
├── views/
│   ├── login_screen.dart
│   ├── signin_screen.dart
│   ├── home_screen.dart
│   └── main_navigation.dart
├── widgets/
│   ├── app_text_form_field.dart
│   └── app_colors.dart
```

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## License

This project is for educational purposes and does not include a license.  
Feel free to use and modify for your own learning.

---

**Tip:**  
For best results, use the official Android Emulator or Genymotion
