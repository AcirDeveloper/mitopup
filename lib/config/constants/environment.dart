import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String url = dotenv.env['THE_MITOPUP_URL__'] ?? 'No hay URL';
}
