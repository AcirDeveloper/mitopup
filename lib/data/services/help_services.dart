import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../data.dart';

class HelpServices {
  static final dio = Dio(BaseOptions(baseUrl: Environment.url));

  static Future<List<HelpEntity>> getListHelps() async {
    try {
      final response = await dio.get('/app.getFaqs?idioma=es');
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final parsedHelps = data.map((item) {
          return HelpEntity(
            titleHelp: item['pregunta'],
            descriptionHelp: item['respuesta'],
          );
        }).toList();
        return parsedHelps;
      } else {
        // Error en la solicitud al webservice
        print('Error en la solicitud al webservice');
        return [];
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      print('Error de conexión o en el formato de la respuesta');
      return [];
    }
  }
}
