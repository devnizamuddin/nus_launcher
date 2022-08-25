import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({Key? key, required this.list, this.validationText, this.hint, required this.onChanged}) : super(key: key);

  final List<String> list;
  final String? hint;
  final String? validationText;
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(hint ?? ''),
      items: list.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
