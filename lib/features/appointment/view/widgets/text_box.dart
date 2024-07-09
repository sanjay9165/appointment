import 'package:appointment/utilities/common_exports.dart';

class AppointmentTextBox extends StatelessWidget {
  const AppointmentTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "WELCOME TO",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontFamily: AppFonts.perptuaTitlingMt,
            ),
          ),
          const Text(
            "Moshi Moshi",
            style: TextStyle(
              fontSize: 50,
              color: AppColors.white,
              fontFamily: AppFonts.bellMt,
            ),
          ),
          Text(
              "Say goodbye to scheduling chaos! With Moshi Moshi, book and manage your appointments with ease.",
              style: context.textTheme.titleSmall),
        ],
      ),
    );
  }
}
