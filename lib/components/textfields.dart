
// ignore_for_file: must_be_immutable

import 'package:coincontrol/imports.dart';

class Fields extends StatefulWidget {
  String? hint;
  bool? obscure;
  double? radius;
  Color? foreground;
  Color? background;
  TextEditingController? controller;
  TextInputType? type;
  Function? validater;

  Fields({
    Key? key,
    this.hint,
    this.type,
    this.validater,
    this.obscure,
    this.radius,
    this.foreground,
    this.background,
    this.controller,
  }) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: widget.background ?? Colors.grey,
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          validator: (value) {
            widget.validater;
            return null;
          },
          controller: widget.controller,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          keyboardType: widget.type,
          obscureText: widget.obscure ?? false,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            hintText: widget.hint,
            border: InputBorder.none,
          ),
        ),
      
      ),
    );
  }
}
