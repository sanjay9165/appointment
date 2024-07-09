import 'package:appointment/utilities/common_exports.dart';

class CommonButton extends StatelessWidget {
  final Color bgColor;
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onTap;
  const CommonButton({
    super.key,
    this.titleStyle,
    required this.bgColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.maxFinite,
        height: 50,
        child: ColoredBox(
          color: bgColor,
          child: Center(
            child: Text(
              title,
              style: titleStyle ?? context.textTheme.displayMedium!,
            ),
          ),
        ),
      ),
    );
  }
}
