import 'package:appointment/utilities/common_exports.dart';

class AppDatePicker extends StatelessWidget {
  final String title;
  final DateTime? date;
  final ValueSetter<DateTime> onChange;
  const AppDatePicker({
    super.key,
    required this.title,
    this.date,
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
        InkWell(
          onTap: () async => await showDatePicker(
                  context: context,
                  initialDate: date ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(4000))
              .then((value) {
            if (value != null) {
              onChange(value);
            }
          }),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.antiFlashWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 50,
              width: context.getScreenWidth(0.42),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  date != null
                      ? DateFormat('dd-MM-yyyy').format(date!)
                      : "DD-MM-YYYY",
                  style: context.textTheme.displaySmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
