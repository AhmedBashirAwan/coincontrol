import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final Widget child;
  final double? radius;
  double? height;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  final OutlinedBorder? shape;
  final bool? enableFeedback;
  double? elevation;
  // Color? shadowColor;
  CustomElevatedBtn({
    Key? key,
    this.enableFeedback,
    // this.shadowColor = const Color.fromARGB(255, 255, 255, 255),
    this.side,
    this.elevation=40,
    this.height,
    this.minimumSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    this.radius = 5,
    this.padding,
    this.tapTargetSize,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        // shadowColor: shadowColor,
        disabledBackgroundColor: Colors.grey,
        enableFeedback: enableFeedback,
        tapTargetSize: tapTargetSize,
        padding: padding,
        side: side,
        fixedSize: height != null ? Size(height!, height!) : null,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: const Size(40, 40),
        shape: (radius == null)
            ? shape
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!),
              ),
      ),
      child: child,
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  final BorderSide? side;
  final OutlinedBorder? shape;

  const CustomTextBtn({
    Key? key,
    this.minimumSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    this.radius,
    this.padding,
    this.tapTargetSize,
    this.side,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        tapTargetSize: tapTargetSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: minimumSize,
        side: side,
        shape: (radius == null)
            ? shape
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!),
              ),
      ),
      child: child,
    );
  }
}
