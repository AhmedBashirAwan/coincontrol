import 'package:coincontrol/imports.dart';

class Links extends StatefulWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Icon? icon;
  final double? radius;
  final double? height;
  final Widget? image;
  final VoidCallback? onTap;
  const Links({
    Key? key,
    this.height,
    this.onTap,
    this.image,
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
        // border: Border.all(
        //     color: widget.foregroundColor ?? Colors.black38, width: 0.3),
        borderRadius: BorderRadius.circular(widget.radius ?? 0.0),
        color: widget.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: widget.image,
              ),
              SizedBox(
                width: getWidth(context) * .03,
              ),
              Text(
                widget.text ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
