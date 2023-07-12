import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final bool obscureText;
  final String hintText;

  const CustomTextfield({
    Key? key,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
      cursorColor: Colors.black.withOpacity(.5),
    );
  }
}
