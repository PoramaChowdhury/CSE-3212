import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueGrey,
        elevation: 9,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 9,
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.grey,
          fontSize: 14, // Slightly larger font for better readability
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black87, // Professional dark color for labels
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        // Softer background color for input fields
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12, // Adds more padding for a cleaner look
        ),
        border: _inputBorder(),
        enabledBorder: _enabledInputBorder(),
        focusedBorder: _focusedInputBorder(),
        errorBorder: _errorInputBorder(),
        focusedErrorBorder: _focusedErrorInputBorder(),
      ),

  );

  static OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), // More rounded corners
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0, // No visible border by default
      ),
    );
  }

  static OutlineInputBorder _enabledInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade400, // Soft grey border for enabled state
        width: 1.5, // Thin border for a sleek look
      ),
    );
  }

  static OutlineInputBorder _focusedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.blueAccent, // Highlight border when focused
        width: 2.0, // Thicker border to emphasize focus
      ),
      // You can add a shadow effect for the focused state if desired
    );
  }

  static OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.redAccent, // Red border for error state
        width: 1.5,
      ),
    );
  }

  static OutlineInputBorder _focusedErrorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red, // More intense red for focused error
        width: 2.0,
      ),
    );
  }

}