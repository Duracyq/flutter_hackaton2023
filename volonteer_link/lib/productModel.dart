class User {
    final String? name;
    final String? surname;
    final int? pesel;
    final String? address;
    final int? phoneNumber;
    final String? email;
    final String? nickname;
    final String? role;
    final Bool? false;
    final int? id;
}

class Event {
  final int id;
  final String title;
  final String desc;
  final String organizator;

  Event({required this.id, required this.title, required this.desc, required this.organizator});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      organizator: json['organizator'],
    );
  }
}