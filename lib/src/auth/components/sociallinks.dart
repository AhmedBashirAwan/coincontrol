import 'package:flutter/material.dart';

class Links extends StatefulWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Icon? icon;
  final double? radius;
  final double? height;

  Links({
    Key? key,
    this.height,
    this.icon,
    this.backgroundColor,
    this.radius,
    this.foregroundColor,
    this.text,
  }) : super(key: key);

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.foregroundColor ?? Colors.black38, width: 0.3),
        borderRadius: BorderRadius.circular(widget.radius ?? 0.0),
        color: widget.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon?.icon,
              color: widget.foregroundColor,
            ),
            const SizedBox(
              // width: widget.text?40:0,
            ),
            Text(
              widget.text ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: widget.foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
