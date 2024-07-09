import 'package:appointment/utilities/common_exports.dart';

class AppDropDown extends StatelessWidget {
  final String title;
  final String? value;
  final bool isFull;
  final List<String> list;
  final String? lable;
  final ValueSetter<String?> onChange;
  const AppDropDown({
    super.key,
    required this.title,
    this.value,
    required this.list,
    this.isFull = false,
    this.lable,
    required this.onChange,
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
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.antiFlashWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 50,
            width: isFull
                ? context.getScreenWidth(1)
                : context.getScreenWidth(0.42),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                  dropdownColor: AppColors.eerieBlack,
                  value: value,
                  decoration: InputDecoration(hintText: lable),
                  icon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.arrow_forward_ios,
                        color: AppColors.white, size: 16),
                  ),
                  items: list.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: context.textTheme.displaySmall,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) => onChange(value)),
            ),
          ),
        ),
      ],
    );
  }
}
