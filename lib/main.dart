import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const VideoToNoteApp());
}

class VideoToNoteApp extends StatelessWidget {
  const VideoToNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video to Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F766E), // Teal color from your design
        scaffoldBackgroundColor: const Color(0xFFF8FAFC), // Light gray background
        fontFamily: 'Roboto', // Default Android font
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}