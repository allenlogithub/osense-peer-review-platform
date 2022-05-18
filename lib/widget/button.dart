import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final IconData icon;
  final String text;
  final VoidCallback callback;
  final bool inverse;
  const Button({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.text,
    required this.callback,
    required this.icon,
    required this.inverse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callback(),
      child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(
          width: 3,
          color: borderColor,
        )),
      ),
    );
  }
}
