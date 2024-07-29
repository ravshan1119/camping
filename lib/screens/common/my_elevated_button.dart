import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.radius,
    this.height,
    this.primaryColor,
    this.width,
    required this.child,
    this.onTap,
    this.expanded,
    this.elevation,
    this.borderColor,
  });

  final double? width, height, radius;
  final Color? primaryColor;
  final Widget child;
  final VoidCallback? onTap;
  final bool? expanded;
  final double? elevation;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(primaryColor ?? Colors.blue),
        fixedSize: MaterialStateProperty.all(
          Size(
            width ?? 0,
            height ?? 48,
          ),
        ),
        elevation: MaterialStateProperty.all(elevation ?? 2),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
                side: BorderSide(color: borderColor ?? Colors.transparent))),
      ),
      onPressed: onTap,
      child: child,
    );
    return (expanded ?? false)
        ? Row(
            children: [Expanded(child: button)],
          )
        : button;
  }
}
