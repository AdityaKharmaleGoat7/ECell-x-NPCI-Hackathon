import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Check if the user is already logged in
  User? user = FirebaseAuth.instance.currentUser;
  String initialRoute = user == null ? '/login' : '/home';

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URS',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/help': (context) => HelpScreen(),
      },
    );
  }
}

// git status
// git add .
// git commit -m "Your commit message"
// git push