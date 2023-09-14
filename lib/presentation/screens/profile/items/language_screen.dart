import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../../config/config.dart';
import '../../../../domain/data.dart';
import '../../../widgets/buttons/language_button.dart';

class LanguageSelectorBottomSheet extends StatefulWidget {
  const LanguageSelectorBottomSheet({super.key});

  @override
  State<LanguageSelectorBottomSheet> createState() =>
      _LanguageSelectorBottomSheet();
}

class _LanguageSelectorBottomSheet extends State<LanguageSelectorBottomSheet> {
  Locale locale = const Locale('es', 'MX');
  String selectedLanguage = 'Español (MX)';

  @override
  void initState() {
    super.initState();
  }

  void changeLanguage(String languageCode, BuildContext context) {
    setState(() {
      if (languageCode == 'Español (MX)') {
        selectedLanguage = 'Español (MX)';
        Literals.load(const Locale('es', 'MX'));
      } else if (languageCode == 'English (US)') {
        selectedLanguage = 'English (US)';
        Literals.load(const Locale('en', 'US'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          capitalize(Literals.of(context).btnLanguage),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: HexColor('#dbdbdb'), width: 1)),
                    ),
                    child: LanguageButton(
                      customButton: CustomLanguageButton(
                        flagAsset: AppImages.mexico,
                        language: 'Español',
                        languageShort: 'MX',
                        isSelected: selectedLanguage == 'Español (MX)',
                        onTap: () => changeLanguage('Español (MX)', context),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: HexColor('#dbdbdb'), width: 1)),
                    ),
                    child: LanguageButton(
                      customButton: CustomLanguageButton(
                        flagAsset: AppImages.usa,
                        language: 'English',
                        languageShort: 'US',
                        isSelected: selectedLanguage == 'English (US)',
                        onTap: () => changeLanguage('English (US)', context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
