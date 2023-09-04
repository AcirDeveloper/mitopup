import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mitopup/presentation/log_in.dart';
import 'package:mitopup/presentation/refills.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/presentation/help.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:mitopup/presentation/screens/language.dart';
import 'package:mitopup/presentation/steps_p1.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  Locale locale = const Locale('es', 'ES');
  String _selectedLanguage = 'Español (MX)';

  void _changeLanguage(String language) {
    setState(() {
      if (language == 'es') {
        _selectedLanguage = 'Español (MX)';
        Literals.load(const Locale('es', 'ES'));
      } else if (language == 'en') {
        _selectedLanguage = 'English (US)';
        Literals.load(const Locale('en', 'US'));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && locales.isNotEmpty) {
      setState(() {
        locale = locales.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        selectedLanguage: _selectedLanguage,
        changeLanguage: _changeLanguage,
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Literals.delegate,
      ],
      supportedLocales: Literals.delegate.supportedLocales,
      routes: {
        '/mitopup/RecargasPage': (context) => const RecargasPage(),
      },
    );
  }
}

class LanguageSelectorBottomSheet extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) changeLanguage;

  const LanguageSelectorBottomSheet({
    required this.selectedLanguage,
    required this.changeLanguage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageButton(
            flagAsset: 'assets/images/mex.png',
            language: 'Español (MX)',
            isSelected: selectedLanguage == 'Español (MX)',
            onTap: () => changeLanguage('es'),
          ),
          const Divider(color: Color(0xFFDBDBDB), thickness: 2, height: 10),
          LanguageButton(
            flagAsset: 'assets/images/usa.png',
            language: 'English (US)',
            isSelected: selectedLanguage == 'English (US)',
            onTap: () => changeLanguage('en'),
          ),
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String flagAsset;
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButton({
    required this.flagAsset,
    required this.language,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : Colors.transparent,
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      icon: Image.asset(
        flagAsset,
        width: 24,
        height: 24,
      ),
      label: Text(
        language,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          letterSpacing: 0.16,
          wordSpacing: 0,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
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
        actions: [
          Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LangPage()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.selectedLanguage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CentroAyudaPage()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        capitalize(Literals.of(context).ayuda),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgHome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            top: _isBottomSheetOpen ? 130 : 450,
          ),
          child: Column(
            mainAxisAlignment: _isBottomSheetOpen
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _logoOffset,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _slideAnimation,
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
                  _animationController.forward();
                  _showOnboardingBottomSheet();
                },
                buttonText: capitalize(Literals.of(context).btnComenzar),
              ),
              const SizedBox(height: 16),
              BlueButton(
                onPressed: () {
                  _animationController.forward();
                  _showIngresar();
                },
                buttonText: capitalize(Literals.of(context).btnIngresar),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOnboardingBottomSheet() {
    setState(() {
      bottomSheetContentIndex = 0;
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
                heightFactor: 0.6,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
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
                  selectedLanguage: widget
                      .selectedLanguage, // Utilizamos la variable del widget para obtener el idioma seleccionado
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
      bottomSheetContentIndex = 1;
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
      bottomSheetContentIndex = 2;
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
            heightFactor:
                0.6, // Ajusta la altura como desees (0.8 significa que ocupa el 80% de la altura disponible)
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
