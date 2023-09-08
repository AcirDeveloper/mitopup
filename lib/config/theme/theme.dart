import 'package:mitopup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: HexColor("#34405F"),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      color: HexColor("#34405F"),
      titleTextStyle: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// Login AppBar Pass
class LightAppBarPass extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingOnPressed;

  const LightAppBarPass({
    Key? key,
    required this.title,
    required this.leadingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, //
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: leadingOnPressed,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      titleTextStyle: GoogleFonts.lato(
        color: HexColor("#34405F"),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: HexColor("#34405F"),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//lightAppBAr help
class LightAppBarAyuda extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingOnPressed;

  const LightAppBarAyuda({
    Key? key,
    required this.title,
    required this.leadingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: leadingOnPressed,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.lato(
        color: HexColor("#34405F"),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: HexColor("#34405F"),
      ),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//dashappbar con notificacion
class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback notificationOnPressed;

  const DashAppBar({
    super.key,
    this.userName = '',
    required this.notificationOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          false, //esto hace que no aparezca el coso de ir para atrás
      title: userName.isNotEmpty
          ? Text(
              Literals.of(context).hello(userName),
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.02,
                color: HexColor("#34405F"),
              ),
            )
          : const Text(''),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30,
          ),
          onPressed: notificationOnPressed,
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(
        color: HexColor("#34405F"),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//Dashboard AppBar delete
class DashAppBarDelete extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback deleteOnPressed;

  const DashAppBarDelete({
    Key? key,
    required this.title,
    required this.deleteOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: deleteOnPressed,
        ),
      ],
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.lato(
        color: HexColor("#34405F"),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: HexColor("#34405F"),
      ),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
