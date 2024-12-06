import '../models/note_model.dart';

abstract class SqfliteRepo {
  Future<int> addNote(NoteModel note);
  Future<List<Map>> getNote(String table);
  Future<int> updateNote(String sql);
  Future<int> deleteNote(int noteID);
}
