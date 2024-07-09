part of 'appointment_bloc.dart';

sealed class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class AppointmentInitialEvent extends AppointmentEvent {}

class GetAppointmentInitialEvent extends AppointmentEvent {}

class AddAppointmentEvent extends AppointmentEvent {
  final Appointment appointment;
  const AddAppointmentEvent(this.appointment);
}

class GetAppointmentEvent extends AppointmentEvent {}

class DeleteAppointmentEvent extends AppointmentEvent {
  final int id;

  const DeleteAppointmentEvent(this.id);
}

class UpdateAppointmentEvent extends AppointmentEvent {
  final Appointment appointment;
  const UpdateAppointmentEvent(this.appointment);
}
