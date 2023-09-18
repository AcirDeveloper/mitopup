import 'package:flutter/material.dart';
import 'package:mitopup/presentation/screens/profile/items/language_screen.dart';

import '../../../config/theme/others.dart';
import '../../../generated/l10n.dart';
import '../../screens/profile/items/help_center_screen.dart';

List<Widget> buildAppBarActions(BuildContext context, String selectedLanguage) {
  return [
    Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LanguageSelectorBottomSheet(
                        //selectedLanguage: '',
                        // changeLanguage: (String p1) {},
                        )),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  selectedLanguage,
                  // Utilizamos la variable del widget para obtener el idioma seleccionado
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HelpCenterScreen()),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  capitalize(Literals.of(context).btnStart),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];
}
