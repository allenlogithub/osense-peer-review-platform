import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String text;
  final VoidCallback callback;
  final bool isFilled;
  const Button({
    Key? key,
    required this.color,
    required this.text,
    required this.callback,
    this.icon,
    required this.isFilled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callback(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
          ],
          Text(text),
        ],
      ),
      style: isFilled
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(
                width: 3,
                color: color,
              )),
            )
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(color),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(
                width: 3,
                color: color,
              )),
            ),
    );
  }
}
