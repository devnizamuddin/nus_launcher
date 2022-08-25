import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.onClick, this.text, this.iconData}) : super(key: key);
  final String? text;
  final IconData? iconData;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.orange[50]),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(children: [
          Icon(
            iconData ?? Icons.document_scanner,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          Text(
            text ?? 'Sample Text',
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          )
        ]),
      ),
    );
  }
}
