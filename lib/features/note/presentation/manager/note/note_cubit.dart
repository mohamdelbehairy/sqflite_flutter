import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repo/sqflite_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._sqfliteRepo) : super(NoteInitial());
  final SqfliteRepo _sqfliteRepo;

  Future<void> addNote({required NoteModel note}) async {
    emit(NoteLoading());
    try {
      int result = await _sqfliteRepo.addNote(note);
      log(result.toString());
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NoteFailure(errorMessage: e.toString()));
      log("error from add note: $e");
    }
  }

  @override
  void onChange(Change<NoteState> change) {
    log("change: $change");
    super.onChange(change);
  }
}
