import 'package:appointment/utilities/common_exports.dart';

// ignore: must_be_immutable
class UpdateAppointment extends StatelessWidget {
  final Appointment appointment;
  const UpdateAppointment({
    super.key,
    required this.appointment,
  });

  static GlobalKey<FormState> updateformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AppBody(
          title: "Update Appointment",
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 30,
            ),
            child: BlocConsumer<AppointmentBloc, AppointmentState>(
              listener: (context, state) {
                if (state is UpdateAppointmentLoadingState) {
                  context.showAppGeneralDialog(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is UpdateAppointmentErrorState) {
                  context.pop();
                  context.showAppSnackBar(title: state.message);
                }

                if (state is UpdateAppointmentSuccessState) {
                  context.showAppSnackBar(
                      title: "Appointment updated successfully");
                  context
                    ..pop()
                    ..pop()
                    ..pop();

                  context
                      .read<AppointmentBloc>()
                      .add(GetAppointmentInitialEvent());
                }
              },
              listenWhen: (previous, current) {
                if (current is UpdateAppointmentLoadingState ||
                    current is UpdateAppointmentSuccessState ||
                    current is UpdateAppointmentErrorState) {
                  return true;
                }

                return false;
              },
              buildWhen: (previous, current) {
                if (current is AppointmentInitial) {
                  return true;
                }

                return false;
              },
              builder: (context, state) {
                if (state is AppointmentInitial ||
                    state is AppointmentSuccessState) {
                  return UpdateAppointmentWidget(appointment: appointment);
                }

                return const SizedBox();
              },
            ),
          ),
        ));
  }
}
