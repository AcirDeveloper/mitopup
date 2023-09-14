import 'package:flutter/material.dart';

class CountryEntity {
  final int idCountry;
  final String countryCode;
  final String countryName;
  final String code;
  final int flag;

  CountryEntity({
    required this.idCountry,
    required this.countryCode,
    required this.countryName,
    required this.code,
    required this.flag,
  });
}

class CustomLanguageButton {
  final String flagAsset;
  final String language;
  final String? languageShort;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomLanguageButton({
    required this.flagAsset,
    required this.language,
    this.languageShort,
    required this.isSelected,
    required this.onTap,
  });
}
