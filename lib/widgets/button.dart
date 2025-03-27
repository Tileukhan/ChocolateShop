import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    required this.onPressed,
    required this.color,
    this.width = 200.0,
    this.height = 50.0,
  });

  final String text;
  final void Function() onPressed;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: Colors.white)),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        ),
      ),
    );
  }
}
