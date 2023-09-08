import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitopup/config/router/app_router.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  Locale locale = const Locale('es', 'ES');
  String selectedLanguage = 'Español (MX)';

  void changeLanguage(String language) {
    setState(() {
      if (language == 'es') {
        selectedLanguage = 'Español (MX)';
        Literals.load(const Locale('es', 'ES'));
      } else if (language == 'en') {
        selectedLanguage = 'English (US)';
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
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
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
    );
  }
}
