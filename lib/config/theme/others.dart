import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'images.dart';

//loader
class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  LoaderState createState() => LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // The animation repeats infinitely
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // White background
      child: Center(
        child: RotationTransition(
          turns: _animationController,
          child: Image.asset(
            AppImages.iconLoader,
            width: 68,
            height: 80,
          ),
        ),
      ),
    );
  }
}

// Login AppBar
class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData actionIcon;
  final VoidCallback actionOnPressed;

  const LoginAppBar({
    super.key,
    required this.title,
    required this.actionIcon,
    required this.actionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // Quitar la sombra
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
          child: Image.asset(
            AppImages.iconLoader,
            width: 32,
            height: 32,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: actionOnPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: HexColor("#34405F"), // Color de texto
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    actionIcon,
                    color: const Color(0xFF34405F),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      shape: Border(
        bottom: BorderSide(
          color: HexColor("#DBDBDB"),
          width: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String capitalize(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}
