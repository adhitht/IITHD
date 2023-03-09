import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String host = "https://iithd2backend.onrender.com";
// For Running in emulator localhost
// const String host = 'http://10.0.2.2:8000';
const String messUrl = 'https://iith.dev/dining';

Map mealTimings = {
  "Breakfast": "7:30AM - 9:30AM",
  "Lunch": "12:00PM - 2:30PM",
  "Snacks": "5:00PM - 6:30PM",
  "Dinner": "8:00PM - 10:30PM"
};

int hour = int.parse(DateFormat('H').format(DateTime.now()));
String weekday = DateFormat('EEEE').format(DateTime.now());

// ## Colors
Color defaultColor = const Color(0xFF3C393E);
// Call App Color in Cab Sharing and others
Color callColor = const Color(0xFF000080);
// Whatsapp Icon Color
Color wacolor = const Color(0xFF1ACC3E);

ThemeData themedata = ThemeData(
  useMaterial3: false,
  primaryColor: const Color(0xFF3C393E),
  fontFamily: 'Inter',
  textTheme: const TextTheme(
    labelSmall: TextStyle(fontFamily: 'Inter', fontSize: 15),
  ),
);
