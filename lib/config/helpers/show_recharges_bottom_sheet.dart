import 'package:flutter/material.dart';
import 'package:mitopup/presentation/screens/recharges/recharges_screen.dart';

void showRechargesBottomSheet(
    BuildContext context,
    Function() updateStateCallback,
    Function updateBottomSheetContextIndex,
    Animation<Offset> slideAnimation,
    AnimationController animationController) {
  updateBottomSheetContextIndex(2);
  animationController.forward();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SlideTransition(
        position: slideAnimation,
        child: const FractionallySizedBox(
          heightFactor: 0.6,
          // Ajusta la altura como desees (0.8 significa que ocupa el 80% de la altura disponible)
          child: RechargesScreen(), //RecargasPage(),
        ),
      );
    },
  ).then((value) {
    updateStateCallback();
    animationController.reverse();
  });
}
