import 'package:flutter/material.dart';

import '../../presentation/screens/profile/items/language_screen.dart';

void showLanguageBottomSheet(
  BuildContext context,
  Function updateStateCallback,
  Function updateBottomSheetContextIndex,
  Animation<Offset> slideAnimation,
  AnimationController animationController,
  String selectedLanguage,
  Function(String) changeLanguage,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SlideTransition(
        position: slideAnimation,
        child: FractionallySizedBox(
          heightFactor: 0.4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: LanguageSelectorBottomSheet(
                // Utilizamos la variable del widget para obtener el idioma seleccionado
                selectedLanguage: selectedLanguage,
                // Utilizamos la variable del widget para cambiar el idioma
                changeLanguage: changeLanguage,
              ),
            ),
          ),
        ),
      );
    },
  ).then((value) {
    updateStateCallback();
    animationController.reverse();
  });
}
