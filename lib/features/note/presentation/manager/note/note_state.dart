part of 'note_cubit.dart';

sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class AddNoteSuccess extends NoteState {}

final class NoteFailure extends NoteState {
  final String errorMessage;

  NoteFailure({required this.errorMessage});
}
