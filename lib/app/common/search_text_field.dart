import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String)? onSubmit;
  final Function()? onEditingComplete;
  final Function(String)? onChange;
  final Function()? onTap;
  final String hint;

  const SearchTextField({
    Key? key,
    required this.textController,
    this.onSubmit,
    this.onChange,
    this.onEditingComplete,
    this.onTap,
    this.hint = "search",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines: 1,
      onChanged: onChange,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmit,
      onTap: onTap,
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
