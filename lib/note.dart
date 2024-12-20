import 'package:intl/intl.dart';

class Note {
  final int? id;
  final String text;
  final DateTime createdAt;

  Note({
    this.id,
    required this.text,
    required this.createdAt,
  });

  // Перетворення об'єкта у Map (для БД)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Створення об'єкта з Map (з БД)
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      text: map['text'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Форматована дата і час
  String get formattedDateTime {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss'); // Рік-місяць-день години:хвилини:секунди
    return formatter.format(createdAt);
  }
}
