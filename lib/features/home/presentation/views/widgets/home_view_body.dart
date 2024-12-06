import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../note/presentation/manager/note/note_cubit.dart';
import 'list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var getNote = context.read<NoteCubit>();
    return BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
      return ListView.builder(
          itemCount: getNote.notes.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.only(top: index == 0 ? 12 : 0, right: 12, left: 12),
                child: ListViewItem(note: getNote.notes[index]));
          });
    });
  }
}
