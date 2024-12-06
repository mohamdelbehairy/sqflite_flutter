import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_flutter/features/note/presentation/views/edit_note_view.dart';

import '../../../../note/data/models/note_model.dart';
import '../../../../note/presentation/manager/note/note_cubit.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(note.title),
          subtitle: Text(note.value),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () async => await context
                      .read<NoteCubit>()
                      .deleteNote(noteID: note.id!),
                  icon: const Icon(Icons.delete, color: Colors.red, size: 22)),
              IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditNoteView(note: note))),
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 20))
            ],
          ),
        ),
      ),
    );
  }
}
