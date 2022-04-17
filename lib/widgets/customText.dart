
import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  late final double size;
  late final Color color;
  late final FontWeight weight;

  CustomText({Key? key, required this.text, double? size, Color? color, FontWeight? weight}) : super(key: key){
    this.size = size ?? 16;
    this.color = color ?? color3;
    this.weight = weight ?? FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight)
    );
  }
}
