import 'package:mitopup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: HexColor("#34405F"),
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

class lightAppBarPass extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingOnPressed;


  const lightAppBarPass({
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
        icon: Icon(Icons.arrow_back),
        onPressed: leadingOnPressed,
      ),
      title: Text(
        title,
        style: TextStyle(
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//lightAppBAr
class lightAppBarAyuda extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingOnPressed;

  const lightAppBarAyuda({
    Key? key,
    required this.title,
    required this.leadingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: leadingOnPressed,
      ),
      title: Text(
        title,
        style: TextStyle(
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


//dashappbar con notificacion
class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback notificationOnPressed;

  const DashAppBar({
    this.userName = '',
    required this.notificationOnPressed,
  });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, //esto hace que no aparezca el coso de ir para atrás
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
          : Text(''),
      actions: [
        IconButton(
          icon: Icon(
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//Dashboard AppBar delete
class dashAppBarDelete extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback deleteOnPressed;

  const dashAppBarDelete({
    Key? key,
    required this.title,
    required this.deleteOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


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
            side: BorderSide(
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
          style: TextStyle(
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
        minimumSize: const Size(double.infinity, 0)
      ),
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
              style: TextStyle(
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

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData actionIcon;
  final VoidCallback actionOnPressed;

  const LoginAppBar({
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
            'assets/images/loader.png',
            width: 32,
            height: 32,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
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
                  SizedBox(width: 8.0),
                  Icon(
                    actionIcon,
                    color: Color(0xFF34405F),
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//loader
class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
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
            'assets/images/loader.png',
            width: 68,
            height: 80,
          ),
        ),
      ),
    );
  }
}

String capitalize(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}


// BOTTOM NAVIGATION
class DashBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  DashBottomNavigation({
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
            currentIndex == 0 ? 'assets/images/bar/home_b.png' : 'assets/images/bar/home.png',
            width: 24,
            height: 24,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1 ? 'assets/images/bar/recargas_b.png' : 'assets/images/bar/recargas.png',
            width: 24,
            height: 24,
          ),
          label: 'Recargas',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2 ? 'assets/images/bar/promos_b.png' : 'assets/images/bar/promos.png',
            width: 24,
            height: 24,
          ),
          label: 'Promos',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 3 ? 'assets/images/bar/perfil_b.png' : 'assets/images/bar/perfil.png',
            width: 24,
            height: 24,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}