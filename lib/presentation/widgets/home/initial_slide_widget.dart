import 'package:flutter/material.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/generated/l10n.dart';

class InitialSlideWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation<Offset> slideAnimation;
  final void Function(int) updateBottomSheetContextIndex;
  final VoidCallback updateParentState;

  const InitialSlideWidget({
    super.key,
    required this.animationController,
    required this.slideAnimation,
    required this.updateBottomSheetContextIndex,
    required this.updateParentState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SlideTransition(
          position: slideAnimation,
          child: Image.asset(
            AppImages.logo,
            width: 150,
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          // Solo para observar, aún no he creado el _slideAnimation
          position: slideAnimation,
          child: Text(
            Literals.of(context).homeMainText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
        WhiteButton(
          onPressed: () {
            showOnboardingBottomSheet(
              context,
              updateParentState,
              updateBottomSheetContextIndex,
              slideAnimation,
              animationController,
            );
          },
          buttonText: capitalize(Literals.of(context).btnStart),
        ),
        const SizedBox(height: 16),
        BlueButton(
          onPressed: () {
            animationController.forward();
            showGetInto(
              context,
              updateParentState,
              updateBottomSheetContextIndex,
              slideAnimation,
              animationController,
            );
          },
          buttonText: capitalize(Literals.of(context).btnGetInto),
        ),
      ],
    );
  }
}
