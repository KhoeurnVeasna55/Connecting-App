import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TextFieldWidget extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final Function(String)? validator;

  const TextFieldWidget({
    super.key,
    this.label,
    this.hint,
    required this.controller,
    this.focusNode,
    required this.validator,
    this.obscureText = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool showobscureText;
  @override
  void initState() {
    super.initState();
    showobscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: showobscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintText: widget.hint,
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    showobscureText ? LucideIcons.eye : LucideIcons.eyeOff,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      showobscureText = !showobscureText;
                    });
                  },
                )
                : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
