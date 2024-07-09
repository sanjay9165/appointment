import 'package:appointment/utilities/common_exports.dart';
import 'package:equatable/equatable.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentInitialEvent>((event, emit) => emit(AppointmentInitial()));

    on<GetAppointmentInitialEvent>(
        (event, emit) => emit(GetAppointmentInitial()));

    on<AddAppointmentEvent>((event, emit) async {
      emit(const AppointmentLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      bool result = await DatabaseService()
          .insertAppointment(appointment: event.appointment);
      emit(result
          ? const AppointmentSuccessState()
          : const AppointmentErrorState(
              message: "Something went wrong, try again"));
    });

    on<GetAppointmentEvent>((event, emit) async {
      emit(const GetAppointmentLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      List<Appointment>? appointments =
          await DatabaseService().getAppointment();
      emit(appointments != null
          ? GetAppointmentSuccessState(appointmentList: appointments)
          : const GetAppointmentErrorState(message: "Data not found"));
    });

    on<DeleteAppointmentEvent>((event, emit) async {
      emit(const DeleteAppointmentLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      bool result = await DatabaseService().deleteAppointment(id: event.id);
      emit(result
          ? const DeleteAppointmentSuccessState()
          : const DeleteAppointmentErrorState(
              message: "Something went wrong, try again"));
    });

    on<UpdateAppointmentEvent>((event, emit) async {
      emit(UpdateAppointmentLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      bool result = await DatabaseService()
          .updateAppointment(appointment: event.appointment);
      emit(result
          ? UpdateAppointmentSuccessState()
          : const UpdateAppointmentErrorState(
              message: "Something went wrong, try again"));
    });
  }
}
