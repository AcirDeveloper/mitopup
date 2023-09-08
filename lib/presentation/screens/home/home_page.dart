import 'package:flutter/material.dart';

import '../../widgets/home/build_app_bar_actions.dart';
import '../../widgets/home/build_home_content.dart';
import '../../widgets/language/language_selector.dart';
import '../../widgets/steps/steps_p1.dart';
import '../auth/iniciar_sesion.dart';
import '../recharges/recargar.dart';

class HomePage extends StatefulWidget {
  static const String name = 'home_page';

  const HomePage({
    Key? key,
    required this.selectedLanguage,
    required this.changeLanguage,
  }) : super(key: key);

  final String selectedLanguage;
  final Function(String) changeLanguage;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _logoOffset;
  bool _isBottomSheetOpen = false;
  int bottomSheetContentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0),
    ).animate(_animationController);
    _logoOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: buildAppBarActions(context, widget.selectedLanguage),
      ),
      extendBodyBehindAppBar: true,
      body: buildHomeContent(
          context,
          _isBottomSheetOpen,
          _animationController,
          _logoOffset,
          _slideAnimation,
          _showOnboardingBottomSheet,
          _showIngresar),
    );
  }

  void _showOnboardingBottomSheet() {
    setState(() {
      bottomSheetContentIndex =
          0; // Mostrar el contenido del Onboarding (StepsBottom)
    });
    _animationController.forward();

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
              position: _slideAnimation,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                // Ajusta la altura como desees (0.8 significa que ocupa el 80% de la altura disponible)
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    color: Colors
                        .transparent, // Puedes cambiar el color de fondo según tus necesidades
                  ),
                  child: StepsBottom(
                    onStep3Complete: () {
                      Navigator.pop(context);
                      // Abrimos el nuevo BottomSheet (RecargasPage)
                      _showRecargarBottomSheet();
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        _isBottomSheetOpen = false;
      });
      _animationController.reverse();
    });
  }

  void showLanguageBottomSheet() {
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
        return SlideTransition(
          position: _slideAnimation,
          child: FractionallySizedBox(
            heightFactor: 0.4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: LanguageSelectorBottomSheet(
                  selectedLanguage: widget.selectedLanguage,
                  // Utilizamos la variable del widget para obtener el idioma seleccionado
                  changeLanguage: widget
                      .changeLanguage, // Utilizamos la variable del widget para cambiar el idioma
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      setState(() {
        _isBottomSheetOpen = false;
      });
      _animationController.reverse();
    });
  }

  void _showIngresar() {
    setState(() {
      bottomSheetContentIndex =
          1; // Mostrar el contenido de Ingresar (LoginPage)
    });
    _animationController.forward();

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
              position: _slideAnimation,
              child: FractionallySizedBox(
                heightFactor: 0.6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: LoginPage(
                    userId:
                        123, // ¡Asegúrate de proporcionar el valor correcto aquí!
                    name: 'John',
                    onStep3Complete: () {
                      Navigator.pop(context);
                      // Abrimos el nuevo BottomSheet (RecargasPage)
                      _showRecargarBottomSheet();
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        _isBottomSheetOpen = false;
      });
      _animationController.reverse();
    });
  }

  void _showRecargarBottomSheet() {
    setState(() {
      bottomSheetContentIndex = 2; // Mostrar el contenido de RecargasPage
    });

    _animationController.forward();

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
        return SlideTransition(
          position: _slideAnimation,
          child: const FractionallySizedBox(
            heightFactor: 0.8,
            // Ajusta la altura como desees (0.8 significa que ocupa el 80% de la altura disponible)
            child: RecargasPage(),
          ),
        );
      },
    ).then((value) {
      setState(() {
        _isBottomSheetOpen = false;
      });
      _animationController.reverse();
    });
  }
}
