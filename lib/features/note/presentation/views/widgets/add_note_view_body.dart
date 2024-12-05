import 'package:flutter/material.dart';
import 'package:sqflite_flutter/features/note/data/repo/sqflite_repo_impl.dart';

import '../../../data/models/text_field_model.dart';
import 'custom_button.dart';
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
          CustomButton(onTap: () async {
           await SqfliteRepoImpl().initSqfliteDB();
          })
        ],
      ),
    );
  }
}
