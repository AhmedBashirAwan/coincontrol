import 'package:coincontrol/imports.dart';

class FormsFields extends StatefulWidget {
  TextEditingController controller;
  String label;

  FormsFields({super.key, required this.controller, required this.label});

  @override
  State<FormsFields> createState() => _FormsFieldsState();
}

class _FormsFieldsState extends State<FormsFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
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
