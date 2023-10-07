class UserModule {
    late final String name;
    late final String surname;
    late final int pesel;
    late final String address;
    late final int phoneNumber;
    late final String email;
    late final String nickname;
    late final String role;
    late final bool regulamin = false;
    late final int id;
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