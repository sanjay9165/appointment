class Appointment {
  final int? id;
  final String name;
  final String gender;
  final String purpose;
  final String dateOfBirth;

  Appointment({
    this.id,
    required this.name,
    required this.gender,
    required this.purpose,
    required this.dateOfBirth,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"] as int,
        name: json["name"].toString(),
        gender: json["gender"].toString(),
        purpose: json["purpose"].toString(),
        dateOfBirth: json["dateOfBirth"].toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "name": name,
        "gender": gender,
        "purpose": purpose,
        "dateOfBirth": dateOfBirth,
      };
}
