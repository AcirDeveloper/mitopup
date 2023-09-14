import 'package:formz/formz.dart';

// Define input validation errors
enum CountryCodeError { empty, format }

// Extend FormzInput and provide the input type and error type.
class CountryCode extends FormzInput<String, CountryCodeError> {
  static final RegExp codeRegExp = RegExp(
    r'^\+\d{1,4}$', // Asumiendo que el código del país tiene el formato "+1234".
  );

  // Call super.pure to represent an unmodified form input.
  const CountryCode.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const CountryCode.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CountryCodeError.empty) return 'El campo es requerido';
    if (displayError == CountryCodeError.format)
      return 'El código del país debe tener el formato "+1234"';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CountryCodeError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CountryCodeError.empty;
    if (!codeRegExp.hasMatch(value)) return CountryCodeError.format;

    return null;
  }
}
