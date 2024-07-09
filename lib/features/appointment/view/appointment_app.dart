import 'package:appointment/utilities/common_exports.dart';

class AppointmentApp extends StatelessWidget {
  const AppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppIcons.earthImage,
                width: context.getScreenWidth(0.85),
                height: context.getScreenHeight(0.40),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointmentTextBox(),
                ButtonBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
