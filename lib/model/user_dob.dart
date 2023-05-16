class UserDOB {
  final DateTime date;
  final int age;
  UserDOB({
    required this.age,
    required this.date,
  });
  factory UserDOB.fromMap(Map<String, dynamic> json) {
    final date = json['date'];
    return UserDOB(
      age: json['age'],
      date: DateTime.parse(date),
    );
  }
}
