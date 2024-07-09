import 'package:appointment/utilities/common_exports.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppBody(
        title: "View Appointment",
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: BlocConsumer<AppointmentBloc, AppointmentState>(
            listenWhen: (previous, current) {
              if (current is GetAppointmentLoadingState ||
                  current is GetAppointmentSuccessState ||
                  current is GetAppointmentErrorState) {
                return true;
              }

              return false;
            },
            buildWhen: (previous, current) {
              if (current is GetAppointmentInitial ||
                  current is GetAppointmentSuccessState) {
                return true;
              }

              return false;
            },
            listener: (context, state) {
              if (state is GetAppointmentLoadingState) {
                context.showAppGeneralDialog(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is GetAppointmentErrorState) {
                context.pop();
                context.showAppSnackBar(title: state.message);
              }

              if (state is GetAppointmentSuccessState) {
                context.pop();
              }
            },
            builder: (context, state) {
              if (state is GetAppointmentInitial) {
                context.read<AppointmentBloc>().add(GetAppointmentEvent());
              }

              if (state is GetAppointmentSuccessState) {
                if (state.appointmentList != null) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: state.appointmentList?.length,
                    itemBuilder: (context, index) => AppointmentCard(
                      appointment: state.appointmentList!.elementAt(index),
                    ),
                  );
                }
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
