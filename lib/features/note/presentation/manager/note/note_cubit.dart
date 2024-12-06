import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repo/sqflite_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._sqfliteRepo) : super(NoteInitial()) {
    _getNote();
  }
  final SqfliteRepo _sqfliteRepo;

  List<NoteModel> notes = [];
  Future<void> addNote({required NoteModel note}) async {
    emit(NoteLoading());
    try {
      int result = await _sqfliteRepo.addNote(note);
      if (result > 0) {
        await _getNote();
      }
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NoteFailure(errorMessage: e.toString()));
      log("error from add note: $e");
    }
  }

  Future<void> _getNote() async {
    try {
      List<Map> data = await _sqfliteRepo.getNote("notes");
      notes = data.map((e) => NoteModel.fromDb(e)).toList();
      emit(GetNoteSuccess());
    } catch (e) {
      emit(NoteFailure(errorMessage: e.toString()));
      log("error from get note: $e");
    }
  }

  Future<void> deleteNote({required int noteID}) async {
    try {
      int result = await _sqfliteRepo.deleteNote(noteID);
      if (result > 0) {
        await _getNote();
      }
      emit(DeleteNoteSuccess());
    } catch (e) {
      emit(NoteFailure(errorMessage: e.toString()));
      log("error from delete note: $e");
    }
  }

  @override
  void onChange(Change<NoteState> change) {
    log("change: $change");
    super.onChange(change);
  }
}
