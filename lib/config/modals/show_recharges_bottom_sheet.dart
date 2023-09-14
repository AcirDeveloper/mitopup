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
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SlideTransition(
        position: slideAnimation,
        child: const FractionallySizedBox(
          heightFactor: 0.6,
          child: RechargesScreen(),
        ),
      );
    },
  ).then((value) {
    updateStateCallback();
    animationController.reverse();
  });
}
