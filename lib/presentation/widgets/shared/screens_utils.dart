import 'package:flutter/material.dart';

import '../../../data/data.dart';

abstract class ScreenUtils {
  Future<void> fetchSelectedCountry({required int countryId});

  Future<void> openCountrySelectionPage({
    required List<CountryEntity> countries,
    required CountryEntity? selectedCountry,
  });

  void checkPhoneNumberField({
    required TextEditingController phoneNumberController,
    required CountryEntity? selectedCountry,
  });

  void updateBottomSheetContextIndex({required int newIndex});

  void updateBottomSheetState({required bool isBottomSheetOpen});

  void navigateToLogin({
    required String phoneNumber,
    required String idPais,
  });
}
