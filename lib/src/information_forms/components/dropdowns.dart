import 'package:coincontrol/imports.dart';

class DropDowns extends StatefulWidget {
  String value;
  Function? onChange;
  DropDowns({super.key, required this.value, this.onChange});

  @override
  State<DropDowns> createState() => _DropDownsState();
}

class _DropDownsState extends State<DropDowns> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        focusColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 15, right: 5, top: 13, bottom: 13),
        fillColor: isDarkTheme(context) == true ? Colors.white : Colors.white,
        filled: true,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 237, 43, 43)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      focusColor: Colors.white,
      value: widget.value,
      onChanged: (String? newValue) {
        widget.onChange;
      },
      items: List<DropdownMenuItem<String>>.generate(
        10,
        (int index) {
          final option = (index + 1).toString();
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        },
      ),
    );
  }
}
