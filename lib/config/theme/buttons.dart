import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/generated/l10n.dart';

import 'images.dart';

// White Button
class WhiteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const WhiteButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 19 / 16,
            letterSpacing: 0.0017,
            color: HexColor("#005CEE"), // Color de texto
          ),
          textAlign: TextAlign.center, // Alineación del texto
        ),
      ),
    );
  }
}

// botón azul
class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const BlueButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: HexColor("#005CEE"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: HexColor("#005CEE"),
              width: 1,
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 19 / 16,
            letterSpacing: 0.0017,
            color: Colors.white, // Color de texto
          ),
          textAlign: TextAlign.center, // Alineación del texto
        ),
      ),
    );
  }
}

// Outline Button
class OutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const OutlineButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: HexColor("#005CEE"),
            width: 1,
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          letterSpacing: 0.0017,
          color: HexColor("#005CEE"), // Color de texto
        ),
        textAlign: TextAlign.center, // Alineación del texto
      ),
    );
  }
}

// ButtonTransparent Button
class ButtonTransparent extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonTransparent({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(16),
          minimumSize: const Size(double.infinity, 0)),
      child: Text(
        buttonText,
        style: TextStyle(
          color: HexColor("#005CEE"), // Color de texto
          fontSize: 18,
        ),
      ),
    );
  }
}

//Botón dinámico
class DynamicButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isFilled;
  final String buttonText;

  const DynamicButton({
    Key? key,
    this.onTap,
    required this.isFilled,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Ink(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isFilled ? HexColor("#005CEE") : HexColor("#75AFFF"),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BOTTOM NAVIGATION
class DashBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const DashBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: HexColor("#0743DF"),
      unselectedItemColor: HexColor("#34405F"),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 0 ? AppImages.homeB : AppImages.home,
            width: 24,
            height: 24,
          ),
          label: Literals.of(context).bottomBar1,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1 ? AppImages.rechargeB : AppImages.recharge,
            width: 24,
            height: 24,
          ),
          label: Literals.of(context).bottomBar2,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2 ? AppImages.promosB : AppImages.promos,
            width: 24,
            height: 24,
          ),
          label: Literals.of(context).bottomBar3,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 3 ? AppImages.profileB : AppImages.profile,
            width: 24,
            height: 24,
          ),
          label: Literals.of(context).bottomBar4,
        ),
      ],
    );
  }
}
