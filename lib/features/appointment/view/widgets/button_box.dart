import 'package:appointment/utilities/common_exports.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<AppointmentBloc>().add(AppointmentInitialEvent());
              context.pushNamed(
                Routes.bookAppointment,
              );
            },
            child: Text(
              "Book appointment",
              style: context.textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 20),
          CommonButton(
            bgColor: AppColors.eerieBlack,
            title: "View appointment",
            onTap: () {
              context.read<AppointmentBloc>().add(GetAppointmentInitialEvent());
              context.pushNamed(Routes.appointmentList);
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
