import 'package:flutter/material.dart';
import 'package:mitopup/presentation/screens/auth/login_screen.dart';

void showGetInto(
  BuildContext context,
  Function updateStateCallback,
  Function updateBottomSheetContextIndex,
  Animation<Offset> slideAnimation,
  AnimationController animationController,
) {
  updateBottomSheetContextIndex(1);
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
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SlideTransition(
            position: slideAnimation,
            child: FractionallySizedBox(
              heightFactor: 0.6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const LoginScreen(),
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
