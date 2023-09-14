import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String url = dotenv.env['THE_MITOPUP_URL__'] ??
      'The API_URL is not configured in .env file';
}
