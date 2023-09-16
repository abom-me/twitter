import 'package:flutter/material.dart';

class RoundedSmallButton extends StatelessWidget {
  const RoundedSmallButton(
      {super.key, required this.onTap, required this.child, required this.backgroundColor, required this.textColor});
  final VoidCallback onTap;
  final String child;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(label: Text(child,style: TextStyle(color: textColor,fontSize: 17),),
      backgroundColor:backgroundColor ,
      labelPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),),
    );
  }
}
