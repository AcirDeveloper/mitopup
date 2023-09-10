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
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SlideTransition(
            position: slideAnimation,
            child: FractionallySizedBox(
              heightFactor: 0.7,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const LoginScreen(),
                // child: LoginPage(
                //   userId: 123,
                //   name: 'John',
                //   onStep3Complete: () {
                //     Navigator.pop(context);
                //     // Abrimos el nuevo BottomSheet (RecargasPage)
                //     showRechargesBottomSheet(
                //         context,
                //         updateStateCallback,
                //         updateBottomSheetContextIndex,
                //         slideAnimation,
                //         animationController);
                //   },
                // ),
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
