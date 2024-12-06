import 'package:flutter/material.dart';

import '../../../../note/data/models/note_model.dart';

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
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red, size: 22)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 20))
            ],
          ),
        ),
      ),
    );
  }
}
