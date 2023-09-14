import 'package:flutter/material.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../presentation/screens/profile/items/language_screen.dart';

void showLanguageBottomSheet(
  BuildContext context,
  Function updateStateCallback,
  Function updateBottomSheetContextIndex,
  Animation<Offset> slideAnimation,
  AnimationController animationController,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: LanguageSelectorBottomSheet(),
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
