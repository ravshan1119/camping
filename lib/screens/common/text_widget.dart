import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    this.overFlow,
    this.textAlign,
    this.maxLines,
    this.fontFamily,
  }) : super(key: key);
  final TextOverflow? overFlow;
  final String? text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overFlow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          fontFamily: fontFamily ?? 'Montserrat',
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize),
    );
  }
}
