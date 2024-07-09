import 'package:appointment/utilities/common_exports.dart';

class BookAppointmentForm extends StatelessWidget {
  final TextEditingController nameController;
  final DateTime? date;
  final String? gender;
  final String? purpose;
  final Key formKey;
  final ValueSetter<DateTime> onChange;
  final ValueSetter<String?> onChangeGender;
  final ValueSetter<String?> onChangePurpose;
  const BookAppointmentForm({
    super.key,
    required this.nameController,
    this.date,
    required this.formKey,
    this.gender,
    this.purpose,
    required this.onChange,
    required this.onChangeGender,
    required this.onChangePurpose,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            title: "Name",
            controller: nameController,
            placeholder: "Enter customer's name",
            keyboardType: TextInputType.name,
            onValidate: (value) {
              if (value == null) {
                return "Name is required";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppDatePicker(
                onChange: (value) {
                  onChange(value);
                },
                title: "Date of birth",
                date: date,
              ),
              AppDropDown(
                onChange: (value) {
                  if (value != null) {
                    onChangeGender(value);
                  }
                },
                title: "Gender",
                lable: "Select gender",
                value: gender,
                list: const ["Male", "Female"],
              )
            ],
          ),
          const SizedBox(height: 20),
          AppDropDown(
            onChange: (value) {
              if (value != null) {
                onChangePurpose(value);
              }
            },
            lable: "Select appointment purpose",
            isFull: true,
            value: purpose,
            title: "Purpose",
            list: const ["Consult", "Surgery"],
          )
        ],
      ),
    );
  }
}
