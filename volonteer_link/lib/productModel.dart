class UserModule {
    late final int id;
    late final String name;
    late final String surname;
    late final String pesel;
    late final String address;
    late final String phonenum;
    late final String email;
    late final int age;
    late final String role;
    late final bool regulamin = false;
}

class Event {
  final int id;
  final String title;
  final String desc;
  final String organizator;
  final String date;

  Event({required this.id, required this.title, required this.desc, required this.organizator, required this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      organizator: json['organizator'],
      date: json['date']
    );
  }
}