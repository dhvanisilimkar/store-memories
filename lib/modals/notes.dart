class NotesModal {
  int id;
  String subtitle;
  String title;

  NotesModal(
    this.id,
    this.title,
    this.subtitle,
  );
  factory NotesModal.fromMap({required Map data}) => NotesModal(
        data['id'],
        data['title'],
        data['subtitle'],
      );
  Map<String, dynamic> get toMap => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
      };
}
