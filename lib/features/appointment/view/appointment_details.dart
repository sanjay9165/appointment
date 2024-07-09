import 'package:appointment/utilities/common_exports.dart';

// ignore: must_be_immutable
class AppointmentDetails extends StatelessWidget {
  final Appointment appointment;
  AppointmentDetails({super.key, required this.appointment});

  static GlobalKey formKeydetails = GlobalKey<FormState>();
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AppBody(
          title: "View Appointment",
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 30,
              ),
              child: BlocConsumer<AppointmentBloc, AppointmentState>(
                  listener: (context, state) {
                if (state is DeleteAppointmentLoadingState) {
                  context.showAppGeneralDialog(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is DeleteAppointmentErrorState) {
                  context.pop();
                  context.showAppSnackBar(title: state.message);
                }

                if (state is DeleteAppointmentSuccessState) {
                  context.showAppSnackBar(
                      title: "Appointment deleted successfully");
                  context
                    ..pop()
                    ..pop();

                  context
                      .read<AppointmentBloc>()
                      .add(GetAppointmentInitialEvent());
                }
              }, listenWhen: (previous, current) {
                if (current is DeleteAppointmentLoadingState ||
                    current is DeleteAppointmentSuccessState ||
                    current is DeleteAppointmentErrorState) {
                  return true;
                }

                return false;
              }, buildWhen: (previous, current) {
                if (current is AppointmentInitial) {
                  return true;
                }

                return false;
              }, builder: (context, state) {
                if (state is AppointmentInitial) {
                  return AppointmentDetailsWidget(appointment: appointment);
                }
                return const SizedBox();
              })),
        ));
  }
}
