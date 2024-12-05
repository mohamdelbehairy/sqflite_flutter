import 'package:flutter/material.dart';

import '../../../data/models/text_field_model.dart';
import 'custom_text_field.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
              textFieldModel: TextFieldModel(
                  hintText: "title", controller: TextEditingController())),
          const SizedBox(height: 16),
          CustomTextField(
              textFieldModel: TextFieldModel(
                  hintText: "value", controller: TextEditingController())),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: () {}, child: const Text("Add Note"))
        ],
      ),
    );
  }
}
