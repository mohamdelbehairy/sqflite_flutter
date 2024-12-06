import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../../data/models/text_field_model.dart';
import '../../manager/note/note_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController title, value;
  @override
  void initState() {
    title = TextEditingController(text: widget.note.title);
    value = TextEditingController(text: widget.note.value);
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
        if (state is UpdateNoteSuccess) {
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
            CustomButton(
                buttonName: 'Edit Note',
                onTap: () async {
                  if (title.text != widget.note.title ||
                      value.text != widget.note.value) {
                    await context.read<NoteCubit>().updateNote(
                        note: NoteModel(
                            id: widget.note.id,
                            title: title.text,
                            value: value.text));
                  }
                })
          ],
        ),
      ),
    );
  }
}
