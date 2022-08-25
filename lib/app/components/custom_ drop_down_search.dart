import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  const CustomDropdownSearch({Key? key, required this.list, this.hint, this.validationText, required this.onChanged}) : super(key: key);

  final Future<List<T>> list;
  final String? hint;
  final String? validationText;
  final void Function(T? object) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
      popupProps: PopupProps.bottomSheet(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search here',
            hintStyle: const TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.green[200],
          ),
        ),
      ),
      asyncItems: (String filter) => list,
      itemAsString: (T u) => u.toString(),
      onChanged: onChanged,
      validator: (T? item) {
        if (item == null) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
