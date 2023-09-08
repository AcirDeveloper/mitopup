import 'package:flutter/material.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/presentation/widgets/buttons/language_button.dart';

class LanguageSelectorBottomSheet extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) changeLanguage;

  const LanguageSelectorBottomSheet({
    required this.selectedLanguage,
    required this.changeLanguage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageButton(
            flagAsset: AppImages.mexico,
            language: 'Español (MX)',
            isSelected: selectedLanguage == 'Español (MX)',
            onTap: () => changeLanguage('es'),
          ),
          const Divider(color: Color(0xFFDBDBDB), thickness: 2, height: 10),
          LanguageButton(
            flagAsset: AppImages.usa,
            language: 'English (US)',
            isSelected: selectedLanguage == 'English (US)',
            onTap: () => changeLanguage('en'),
          ),
        ],
      ),
    );
  }
}