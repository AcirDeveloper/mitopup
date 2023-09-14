import 'package:formz/formz.dart';

// Define input validation errors
enum PhoneNumberError { empty, format }

// Extend FormzInput and provide the input type and error type.
class PhoneNumber extends FormzInput<String, PhoneNumberError> {
  static final RegExp phoneRegExp = RegExp(
    r'^\d{10}$', // Asumiendo que un número de teléfono tiene 10 dígitos.
  );

  // Call super.pure to represent an unmodified form input.
  const PhoneNumber.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PhoneNumber.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PhoneNumberError.empty) return 'El campo es requerido';
    if (displayError == PhoneNumberError.format)
      return 'El número de teléfono debe tener 10 dígitos numéricos';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PhoneNumberError? validator(String value) {
    if (value.isEmpty || value
        .trim()
        .isEmpty) return PhoneNumberError.empty;
    if (!phoneRegExp.hasMatch(value)) return PhoneNumberError.format;

    return null;
  }
}
