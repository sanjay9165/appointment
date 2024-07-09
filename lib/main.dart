import 'package:appointment/utilities/common_exports.dart';

void main() async {
  await DatabaseService().initialiseApp();
  await DatabaseService().getDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      _sub = uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          setInitialRoute(uri.toString());
        }
      }, onError: (err) {});

      final initialUri = await getInitialUri();
      if (initialUri != null) {
        setInitialRoute(initialUri.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void setInitialRoute(String uri) {
    const String base = "appointment://";
    String initialRoute = Routes.appointmentApp;
    switch (uri) {
      case "${base}appointmentdetails":
        initialRoute = Routes.appointmentDetails;
        break;
      case "${base}appointmentlist":
        initialRoute = Routes.appointmentList;
        break;
      case "${base}bookappointment":
        initialRoute = Routes.bookAppointment;
        break;
      case "${base}updateappointment":
        initialRoute = Routes.updateAppointment;
        break;
    }

    NavigationService.context.pushNamed(initialRoute);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc(),
      child: MaterialApp(
        title: 'Appointment',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().light,
        initialRoute: Routes.appointmentApp,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationService.generateRoute,
      ),
    );
  }
}
