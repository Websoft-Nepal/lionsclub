import 'package:flutter/material.dart';

class MyCustomIconButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onPressed;
  var color;
  var icon;

  MyCustomIconButton({
    required this.iconName,
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: color), // You can customize the color here
          SizedBox(height: 6),
          Text(iconName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
              color: Colors.black, // You can customize the text color here
            ),
          ),
        ],
      ),
    );
  }
}
