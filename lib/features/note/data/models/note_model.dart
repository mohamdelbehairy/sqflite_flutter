class NoteModel {
  String? id;
  final String title, value;

  NoteModel({this.id, required this.title, required this.value});

  factory NoteModel.fromDb(data) {
    return NoteModel(
        id: data['id'], title: data['title'], value: data['value']);
  }
}
