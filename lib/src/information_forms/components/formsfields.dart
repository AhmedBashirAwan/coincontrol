import 'package:coincontrol/imports.dart';

class FormsFields extends StatefulWidget {
  TextEditingController controller;
  TextInputType? inputType;
  String? label;
  String? prefix;
  List<TextInputFormatter> formats;
  FormsFields(
      {super.key,
      required this.controller,
      this.label,
      required this.formats,
      this.inputType,
      this.prefix});

  @override
  State<FormsFields> createState() => _FormsFieldsState();
}

class _FormsFieldsState extends State<FormsFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.formats,
      controller: widget.controller,
      decoration: InputDecoration(
        prefix: Text("${widget.prefix}"),
        labelText: widget.label,
        filled: true,
        labelStyle: TextStyle(
            color: isDarkTheme(context) == true ? Colors.white : Colors.black),
        fillColor:
            isDarkTheme(context) == true ? Colors.black54 : Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
