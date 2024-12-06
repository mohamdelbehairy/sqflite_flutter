import '../models/note_model.dart';

abstract class SqfliteRepo {
  Future<int> addNote(NoteModel note);
  Future<List<Map>> getNote(String table);
  Future<int> updateNote(NoteModel note);
  Future<int> deleteNote(int noteID);
  Future<void> deleteAllNotes();

  Future<int> add(NoteModel note);
  Future<List<Map>> get(String table);
  Future<int> update(NoteModel note);
  Future<int> delete(int noteID);
}
