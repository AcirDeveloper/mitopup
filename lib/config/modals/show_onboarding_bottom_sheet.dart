import 'package:flutter/material.dart';

import '../../presentation/screens/home/steps.dart';
import '../config.dart';

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
              heightFactor: 0.6,
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: StepsBottom(
                  onStep3Complete: () {
                    Navigator.pop(context);
                    showRechargesBottomSheet(
                        context,
                        updateStateCallback,
                        updateBottomSheetContextIndex,
                        slideAnimation,
                        animationController);
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
