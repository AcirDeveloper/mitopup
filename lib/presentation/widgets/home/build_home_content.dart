import 'package:flutter/material.dart';

import '../../../config/theme/buttons.dart';
import '../../../config/theme/images.dart';
import '../../../config/theme/others.dart';

Widget buildHomeContent(
    BuildContext context,
    bool _isBottomSheetOpen,
    AnimationController _animationController,
    Animation<Offset> _logoOffset,
    Animation<Offset> _slideAnimation,
    Function _showOnboardingBottomSheet,
    Function _showIngresar) {
  return Container(
    padding: const EdgeInsets.all(25.0),
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.background),
        fit: BoxFit.cover,
      ),
    ),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(
        // 130 : 450
        top: _isBottomSheetOpen ? 130 : 450,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: _isBottomSheetOpen
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoOffset,
              child: Image.asset(
                AppImages.logo,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: const Text(
                'Bienvenido a Mi Tópup',
                // Literals.of(context).homeMainText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            WhiteButton(
                onPressed: () {
                  _animationController.forward();
                  _showOnboardingBottomSheet();
                },
                buttonText:
                    'Comenzar' //capitalize(Literals.of(context).btnStart),
                ),
            const SizedBox(height: 16),
            BlueButton(
                onPressed: () {
                  _animationController.forward();
                  _showIngresar();
                },
                buttonText:
                    'Ingresar' //capitalize(Literals.of(context).btnNext),
                ),
          ],
        ),
      ),
    ),
  );
}
