import 'package:flutter/material.dart';
import 'package:mitopup/presentation/screens/profile/items/language_screen.dart';
import '../../screens/help/ayuda.dart';

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
                    builder: (context) => LanguageSelectorBottomSheet(
                          selectedLanguage: '',
                          changeLanguage: (String p1) {},
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
                    builder: (context) => const CentroAyudaPage()),
              );
            },
            child: const Row(
              children: [
                Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                SizedBox(width: 4),
                Text(
                  'Comenzar', // capitalize(Literals.of(context).btnStart),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];
}
