import 'package:flutter/material.dart';
import 'package:upcoming_date/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.purple,
          selectionColor: Colors.deepPurple[100],
          selectionHandleColor: Colors.deepPurple[100],
        ),
      ),
      home: HomeScreen(),
    );
  }
}
