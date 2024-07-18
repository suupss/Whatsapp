import 'package:flutter/material.dart';
import 'package:work_app/home_page/view/home_page_view.dart';
import 'package:work_app/login_page/view/login_page_view.dart';
import 'package:work_app/signup_page/view/signup_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //useMaterial3: true,
        //colorScheme:
        //  ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 173, 32, 166))
        //  .copyWith(
        // primary: Color.fromARGB(255, 173, 32, 166),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 173, 32, 166),
          foregroundColor: Colors.white, //here you can give the text color
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 173, 32, 166),
            foregroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 32, 166),
                foregroundColor: Colors.white)),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 15, height: 2),
        ),
      ),
      home: LoginPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/enterlogin': (context) => const HomePage()
      },
    );
  }
}
