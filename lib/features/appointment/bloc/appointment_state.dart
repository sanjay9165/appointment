part of 'appointment_bloc.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

final class GetAppointmentInitial extends AppointmentState {}

class AppointmentErrorState extends AppointmentState {
  final String message;
  const AppointmentErrorState({required this.message});
}

class AppointmentLoadingState extends AppointmentState {
  const AppointmentLoadingState();
}

class AppointmentSuccessState extends AppointmentState {
  const AppointmentSuccessState();
}

class DeleteAppointmentErrorState extends AppointmentState {
  final String message;
  const DeleteAppointmentErrorState({required this.message});
}

class DeleteAppointmentLoadingState extends AppointmentState {
  const DeleteAppointmentLoadingState();
}

class DeleteAppointmentSuccessState extends AppointmentState {
  const DeleteAppointmentSuccessState();
}

class GetAppointmentErrorState extends AppointmentState {
  final String message;
  const GetAppointmentErrorState({required this.message});
}

class GetAppointmentLoadingState extends AppointmentState {
  const GetAppointmentLoadingState();
}

class GetAppointmentSuccessState extends AppointmentState {
  final List<Appointment>? appointmentList;
  const GetAppointmentSuccessState({this.appointmentList});
}

final class UpdateAppointmentSuccessState extends AppointmentState {}

final class UpdateAppointmentErrorState extends AppointmentState {
  final String message;

  const UpdateAppointmentErrorState({required this.message});
}

final class UpdateAppointmentLoadingState extends AppointmentState {}
