// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mitopup/presentation/widgets/shared/screens_utils.dart';

import '../../../data/data.dart';
import '../../screens/screens.dart';

class InitialUtils implements ScreenUtils {
  final RechargesScreenState _state;

  InitialUtils(this._state);

  @override
  void checkPhoneNumberField(
      {required TextEditingController phoneNumberController,
      required CountryEntity? selectedCountry}) {
    final phoneNumber =
        phoneNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final previousSelection = phoneNumberController.selection;
    phoneNumberController.text = phoneNumber;
    final requiredDigits = selectedCountry?.digits ?? 0;
    final isPhoneNumberFilled = phoneNumber.length >= requiredDigits;
    phoneNumberController.selection = previousSelection;
  }

  @override
  void navigateToLogin({required String phoneNumber, required String idPais}) {
    // _state.navigateToLogin(phoneNumber: phoneNumber, idPais: idPais);
    print('Recharge made for the country $idPais y number $phoneNumber');
  }

  @override
  Future<void> openCountrySelectionPage(
      {required List<CountryEntity> countries,
      required CountryEntity? selectedCountry}) async {
    final selected = await Navigator.push<CountryEntity>(
      _state.context,
      MaterialPageRoute(
        builder: (context) => CountrySelectionScreen(
          countries: countries,
          selectedCountry: selectedCountry,
        ),
      ),
    );

    if (selected != null) {
      fetchSelectedCountry(countryId: selected.idCountry);
    }
  }

  @override
  void updateBottomSheetContextIndex({required int newIndex}) {
    _state.updateBottomSheetContextIndex(newIndex);
  }

  @override
  void updateBottomSheetState({required bool isBottomSheetOpen}) {
    _state.updateBottomSheetState(isBottomSheetOpen);
  }

  @override
  Future<void> fetchSelectedCountry({required int countryId}) {
    // TODO: implement fetchSelectedCountry
    throw UnimplementedError();
  }
}
