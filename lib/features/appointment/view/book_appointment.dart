import 'package:appointment/utilities/common_exports.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({
    super.key,
  });

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AppBody(
          title: "Book Appointment",
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 30,
            ),
            child: BlocConsumer<AppointmentBloc, AppointmentState>(
              listener: (context, state) {
                if (state is AppointmentLoadingState) {
                  context.showAppGeneralDialog(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is AppointmentErrorState) {
                  context.pop();
                  context.showAppSnackBar(title: state.message);
                }

                if (state is AppointmentSuccessState) {
                  context.showAppSnackBar(
                      title: "Appointment added successfully");
                  context
                    ..pop()
                    ..pop();
                  context.pushNamed(Routes.appointmentList);
                  context
                      .read<AppointmentBloc>()
                      .add(GetAppointmentInitialEvent());
                }
              },
              listenWhen: (previous, current) {
                if (current is AppointmentLoadingState ||
                    current is AppointmentSuccessState ||
                    current is AppointmentErrorState) {
                  return true;
                }

                return false;
              },
              buildWhen: (previous, current) {
                if (current is AppointmentLoadingState ||
                    current is AppointmentSuccessState ||
                    current is AppointmentErrorState) {
                  return false;
                }

                return true;
              },
              builder: (context, state) {
                if (state is AppointmentInitial) {
                  return const BookAppointmentWidget();
                }

                return const SizedBox();
              },
            ),
          ),
        ));
  }
}
