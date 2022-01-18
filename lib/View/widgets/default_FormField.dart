import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String label;
  String Value;
  IconData prefix;
  IconData suffix;
  Function validator;
  Function suffixPressed;
  bool isObscure;

  DefaultFormField({
    this.controller,
    this.type,
    this.label,
    this.Value,
    this.prefix,
    this.suffix,
    this.validator,
    this.suffixPressed,
    this.isObscure,
  });

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: isObscure,
      controller: controller,
      keyboardType: type,
      onSaved: (value) {
        Value = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: InkWell(
          onTap: suffixPressed,
          child: Icon(
            suffix,
          ),
        ),
      ),
    );
  }
}