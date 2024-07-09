import 'package:appointment/utilities/common_exports.dart';

class UpdateAppointmentWidget extends StatelessWidget {
  final Appointment appointment;
  const UpdateAppointmentWidget({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: appointment.name);
    DateTime dateOfBirth = DateTime.parse(appointment.dateOfBirth);
    String gender = appointment.gender;
    String purpose = appointment.purpose;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BookAppointmentForm(
            formKey: UpdateAppointment.updateformKey,
            nameController: nameController,
            date: dateOfBirth,
            gender: gender,
            purpose: purpose,
            onChange: (DateTime value) {
              setState(() {
                dateOfBirth = value;
              });
            },
            onChangeGender: (String? value) {
              setState(() {
                gender = value!;
              });
            },
            onChangePurpose: (String? value) {
              setState(() {
                purpose = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (dateOfBirth.toString().isEmpty ||
                  gender.isEmpty ||
                  purpose.isEmpty ||
                  nameController.text.isEmpty) {
                context.showAppSnackBar(title: "All fields are require");
              } else {
                context.read<AppointmentBloc>().add(
                      UpdateAppointmentEvent(
                        Appointment(
                          id: appointment.id,
                          name: nameController.text,
                          gender: gender,
                          purpose: purpose,
                          dateOfBirth: dateOfBirth.toString(),
                        ),
                      ),
                    );
              }
            },
            child: Text(
              "Update Appointment",
              style: context.textTheme.displayMedium,
            ),
          ),
        ],
      );
    });
  }
}
