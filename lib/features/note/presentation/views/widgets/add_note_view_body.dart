import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_flutter/features/note/data/models/note_model.dart';
import 'package:sqflite_flutter/features/note/presentation/manager/note/note_cubit.dart';

import '../../../data/models/text_field_model.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  late TextEditingController title, value;
  @override
  void initState() {
    title = TextEditingController();
    value = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomTextField(
                textFieldModel:
                    TextFieldModel(hintText: "title", controller: title)),
            const SizedBox(height: 16),
            CustomTextField(
                textFieldModel:
                    TextFieldModel(hintText: "value", controller: value)),
            const SizedBox(height: 32),
            CustomButton(onTap: () async {
              if (title.text.isNotEmpty && value.text.isNotEmpty) {
                await context.read<NoteCubit>().addNote(
                    note: NoteModel(title: title.text, value: value.text));
              }
            })
          ],
        ),
      ),
    );
  }
}
