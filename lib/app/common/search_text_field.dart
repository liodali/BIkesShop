import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hint;

  const SearchTextField({
    Key? key,
    required this.textController,
    this.hint = "search",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          fillColor: Colors.grey[300],
          hintText: hint,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(5.0)),
    );
  }
}
