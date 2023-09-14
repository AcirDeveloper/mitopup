import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../widgets/widgets.dart';

//! 3 - StateNotifierProvider - consume afuera
final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});

//! 2 - Como implementamos un notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  onPhoneChange(String value) {
    final newPhone = PhoneNumber.dirty(value);
    state = state.copyWith(
        phoneNumber: newPhone,
        isValid: Formz.validate([newPhone, state.codeCountry]));
  }

  onCodeCountryChange(String value) {
    final newCodeCountry = CountryCode.dirty(value);
    state = state.copyWith(
        codeCountry: newCodeCountry,
        isValid: Formz.validate([newCodeCountry, state.phoneNumber]));
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;

    print(state);
  }

  _touchEveryField() {
    final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    final codeCountry = CountryCode.dirty(state.phoneNumber.value);

    state = state.copyWith(
        isFormPosted: true,
        phoneNumber: phoneNumber,
        codeCountry: codeCountry,
        isValid: Formz.validate([phoneNumber, codeCountry]));
  }
}

//! 1 - State de este provider
class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final PhoneNumber phoneNumber;
  final CountryCode codeCountry;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.phoneNumber = const PhoneNumber.pure(),
    this.codeCountry = const CountryCode.pure(),
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    PhoneNumber? phoneNumber,
    CountryCode? codeCountry,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        codeCountry: codeCountry ?? this.codeCountry,
      );

  @override
  String toString() {
    return '''
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      phoneNumber: $phoneNumber
      codeCountry: $codeCountry
    ''';
  }
}
