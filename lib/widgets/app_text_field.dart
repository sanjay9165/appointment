import 'package:appointment/utilities/common_exports.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final String placeholder;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final FormFieldValidator<String>? onValidate;

  const AppTextField({
    super.key,
    this.format,
    this.onValidate,
    required this.title,
    required this.controller,
    required this.placeholder,
    required this.keyboardType,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Text(
            title,
            style: context.textTheme.displaySmall,
          ),
        ),
        TextFormField(
          validator: onValidate,
          controller: controller,
          inputFormatters: format,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.ulagadiSansRegular,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(hintText: placeholder, prefix: prefix),
        ),
      ],
    );
  }
}
