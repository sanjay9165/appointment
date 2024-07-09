import 'package:appointment/utilities/common_exports.dart';

class AppointmentDetailsWidget extends StatelessWidget {
  final Appointment appointment;
  const AppointmentDetailsWidget({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AbsorbPointer(
          child: BookAppointmentForm(
            formKey: AppointmentDetails.formKeydetails,
            nameController: TextEditingController(text: appointment.name),
            date: DateTime.parse(appointment.dateOfBirth),
            gender: appointment.gender,
            purpose: appointment.purpose,
            onChange: (DateTime value) {},
            onChangeGender: (String? value) {},
            onChangePurpose: (String? value) {},
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: AppColors.primaryColor))),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.eerieBlack)),
              onPressed: () {
                context.pushNamed(Routes.updateAppointment,
                    arguments: appointment);
                context.read<AppointmentBloc>().add(AppointmentInitialEvent());
              },
              child: Text(
                "Edit Details",
                style: context.textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 20),
            CommonButton(
              titleStyle: context.textTheme.titleMedium!
                  .copyWith(color: AppColors.error),
              bgColor: AppColors.eerieBlack,
              title: "Delete appointment",
              onTap: () => context
                  .read<AppointmentBloc>()
                  .add(DeleteAppointmentEvent(appointment.id!)),
            ),
          ],
        ),
      ],
    );
  }
}
