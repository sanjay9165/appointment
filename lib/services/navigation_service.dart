import 'package:appointment/features/appointment/view/update_appointment.dart';
import 'package:appointment/utilities/common_exports.dart';

class Routes {
  static const String appointmentApp = "/";
  static const String bookAppointment = "/bookAppointment";
  static const String appointmentList = "/appointmentList";
  static const String updateAppointment = "/updateAppointment";
  static const String appointmentDetails = "/appointmentDetails";
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.appointmentApp:
        return MaterialPageRoute(builder: (_) => const AppointmentApp());
      case Routes.bookAppointment:
        return MaterialPageRoute(builder: (_) {
          return const BookAppointment();
        });
      case Routes.updateAppointment:
        return MaterialPageRoute(builder: (_) {
          return UpdateAppointment(
              appointment: settings.arguments as Appointment);
        });
      case Routes.appointmentDetails:
        return MaterialPageRoute(
            builder: (_) => AppointmentDetails(
                  appointment: settings.arguments as Appointment,
                ));
      case Routes.appointmentList:
        return MaterialPageRoute(builder: (_) => const AppointmentList());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
