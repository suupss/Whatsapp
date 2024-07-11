import 'package:flutter/material.dart';
import 'package:work_app/home_page.dart';
import 'package:work_app/login_page.dart';
import 'package:work_app/sign_up_page.dart';

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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: const Color.fromARGB(255, 173, 32, 166),
            foregroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 32, 166),
                foregroundColor: Colors.white)),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 15, height: 2),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/enterlogin': (context) => const HomePage()
      },
    );
  }
}
