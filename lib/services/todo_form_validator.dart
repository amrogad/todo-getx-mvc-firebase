import 'package:form_field_validator/form_field_validator.dart';

class TodoFormValidator {
  static final String? Function(String?) taskTitleValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter a task title."),
    MinLengthValidator(3, errorText: "Please enter at least 3 characters."),
  ]);
  static final String? Function(String?) taskDescValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter a task description."),
    MinLengthValidator(3, errorText: "Please enter at least 3 characters."),
  ]);
}
