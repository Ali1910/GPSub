class AppointmentDateModelDTO {
  final int id;
  final int dcotorid;
  final int timeid;
  final String year;
  final String month;
  final String day;
  final String appointmentTime;
  final String doctorPic;
  final String doctorName;
  final String doctorNum;
  final String doctorSpec;
  final int fee;
  final String univ;
  final bool rated;

  AppointmentDateModelDTO(
      {required this.appointmentTime,
      required this.day,
      required this.dcotorid,
      required this.doctorName,
      required this.doctorNum,
      required this.doctorPic,
      required this.doctorSpec,
      required this.id,
      required this.month,
      required this.timeid,
      required this.year,
      required this.fee,
      required this.univ,
      required this.rated});

  factory AppointmentDateModelDTO.fromjson(json) {
    return AppointmentDateModelDTO(
      appointmentTime: json['appointmentTime'],
      day: json['day'],
      dcotorid: json['doctorid'],
      doctorName: json['name'],
      doctorNum: json['number'],
      doctorPic: json['pic'],
      doctorSpec: json['spec'],
      id: json['id'],
      month: json['month'],
      timeid: json['timeid'],
      year: json['year'],
      fee: json['fee'],
      univ: json['unviersity'],
      rated: json['rated'],
    );
  }
}
