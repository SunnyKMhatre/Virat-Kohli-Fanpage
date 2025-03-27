import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.maxLength,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final int maxLength;
  final bool isObscure;

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
