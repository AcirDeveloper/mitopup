import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../data.dart';

class CountryServices {
  static final dio = Dio(BaseOptions(baseUrl: Environment.url));

  static Future<List<CountryEntity>> fetchCountries() async {
    try {
      final response = await dio.get('/app.listaPaises');
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final parsedCountries = data.map((item) {
          return CountryEntity(
            idCountry: item['idPais'],
            countryName: item['nombre'],
            countryCode: item['codPais'],
            flag: item['bandera'],
            digits: item['digitos'] as int,
          );
        }).toList();
        return parsedCountries;
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

  static Future<CountryEntity> fetchSelectedCountry(int countryId) async {
    try {
      final response = await dio.get('/app.getPais?idPais=$countryId');
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final parsedCountries = data.map((item) {
          return CountryEntity(
            idCountry: item['idPais'],
            countryName: item['nombre'],
            countryCode: item['codPais'],
            flag: item['bandera'],
            digits: item['digitos'] as int,
          );
        }).toList();
        return parsedCountries[0];
      } else {
        // Error en la solicitud al webservice
        print('Error en la solicitud al webservice');
        return CountryEntity(
          idCountry: 0,
          countryName: '',
          countryCode: '',
          flag: '',
          digits: 0,
        );
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      print('Error de conexión o en el formato de la respuesta');
      return CountryEntity(
        idCountry: 0,
        countryName: '',
        countryCode: '',
        flag: '',
        digits: 0,
      );
    }
  }
}
