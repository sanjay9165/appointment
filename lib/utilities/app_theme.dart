import 'package:appointment/utilities/common_exports.dart';

class AppTheme {
  factory AppTheme() => _singleton;

  static final AppTheme _singleton = AppTheme._internal();

  AppTheme._internal();

  ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.eerieBlack,
        primaryColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.white),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: AppColors.white),
            titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.ulagadiSansRegular,
              color: AppColors.white,
            )),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.ulagadiSansRegular,
            color: AppColors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.ulagadiSansMedium,
            color: AppColors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.ulagadiSansRegular,
            color: AppColors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: AppFonts.ulagadiSansLight,
            color: AppColors.white,
          ),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(double.maxFinite, 50)),
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.ulagadiSansMedium,
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.antiFlashWhite,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          isDense: true,
          errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.ulagadiSansRegular,
            color: AppColors.error,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.ulagadiSansRegular,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
