import 'package:flutter/material.dart';

import '../../../data/models/text_field_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldModel.controller,
      decoration: InputDecoration(hintText: textFieldModel.hintText),
    );
  }
}
