import 'package:flutter/material.dart';
import 'package:twitter/theme/pallete.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Pallete.blueColor, width: 3),
          ),
          contentPadding: EdgeInsets.all(22),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Pallete.greyColor, width: 1),
          ),
          hintStyle: TextStyle(fontSize: 18)),
    );
  }
}
