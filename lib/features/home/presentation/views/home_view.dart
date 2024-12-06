import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../note/presentation/manager/note/note_cubit.dart';
import '../../../note/presentation/views/add_note_view.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var note = context.read<NoteCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), actions: [
        IconButton(
            onPressed: () async {
              if (note.notes.isNotEmpty) {
                await note.deleteAllNotes();
              }
            },
            icon: const Icon(Icons.delete)),
      ]),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddNoteView())),
      ),
    );
  }
}
