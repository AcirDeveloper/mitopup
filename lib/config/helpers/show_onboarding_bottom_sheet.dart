import 'package:flutter/material.dart';
import 'package:mitopup/config/helpers/show_recharges_bottom_sheet.dart';

import '../../presentation/screens/home/steps.dart';

void showOnboardingBottomSheet(
  BuildContext context,
  Function() updateStateCallback,
  Function updateBottomSheetContextIndex,
  Animation<Offset> slideAnimation,
  AnimationController animationController,
) {
  updateBottomSheetContextIndex(0);
  animationController.forward();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SlideTransition(
            position: slideAnimation,
            child: FractionallySizedBox(
              heightFactor: 0.6, // Ajusta la altura como desees
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  // Cambia el color de fondo según tus necesidades
                  color: Colors.transparent,
                ),
                child: StepsBottom(
                  onStep3Complete: () {
                    Navigator.pop(context);
                    // Abre el nuevo BottomSheet (RecargasPage)
                    showRechargesBottomSheet(
                        context,
                        updateStateCallback,
                        updateBottomSheetContextIndex,
                        slideAnimation,
                        animationController); // Asegúrate de ajustar esto
                  },
                ),
              ),
            ),
          );
        },
      );
    },
  ).then((value) {
    updateStateCallback();
    animationController.reverse();
  });
}
