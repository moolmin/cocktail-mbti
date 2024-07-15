import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.labelStyle,
    this.width = 500.0, // Set a default width
    this.height = 60.0, // Set a default height
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey[300]!;
            }
            return Colors.white; // Background color
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return Color(0xFF11181A); // Text color
          }),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height / 2), // Make it circular
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        child: Text(
          label,
          style: labelStyle,
        ),
      ),
    );
  }
}
