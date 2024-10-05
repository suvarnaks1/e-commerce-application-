import 'package:flutter/material.dart';

class GreenContainer extends StatelessWidget {
  final VoidCallback? onTap; // Callback for the onTap event
  final String text; // Added parameter for the button text

  const GreenContainer({
    Key? key,
    this.onTap, // Initialize the onTap parameter
    this.text = 'Add To Basket', // Default button text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the passed onTap callback
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: _buildText(text), // Use the extracted method for text
      ),
    );
  }

  // Method to create styled text
  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, color: Colors.white), // Default text style
    );
  }
}
