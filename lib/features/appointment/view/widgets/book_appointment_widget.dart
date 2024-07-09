import 'package:appointment/utilities/common_exports.dart';

class BookAppointmentWidget extends StatelessWidget {
  const BookAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    DateTime? dateOfBirth;
    String? gender;
    String? purpose;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BookAppointmentForm(
            formKey: BookAppointment.formKey,
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
                gender = value;
              });
            },
            onChangePurpose: (String? value) {
              setState(() {
                purpose = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (dateOfBirth == null ||
                  gender == null ||
                  purpose == null ||
                  nameController.text.isEmpty) {
                context.showAppSnackBar(title: "All fields are require");
              } else {
                context.read<AppointmentBloc>().add(
                      AddAppointmentEvent(
                        Appointment(
                          name: nameController.text,
                          gender: gender!,
                          purpose: purpose!,
                          dateOfBirth: dateOfBirth.toString(),
                        ),
                      ),
                    );
              }
            },
            child: Text(
              "Book Now",
              style: context.textTheme.displayMedium,
            ),
          ),
        ],
      );
    });
  }
}
