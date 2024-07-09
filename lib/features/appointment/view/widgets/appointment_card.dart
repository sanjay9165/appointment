import 'package:appointment/utilities/common_exports.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: ListTile(
        onTap: () {
          context.pushNamed(Routes.appointmentDetails, arguments: appointment);
          context.read<AppointmentBloc>().add(AppointmentInitialEvent());
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        tileColor: AppColors.antiFlashWhite,
        title: Text(
          appointment.name,
          style: context.textTheme.titleMedium,
        ),
        trailing: Text(
          "View",
          style: context.textTheme.displaySmall!
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
