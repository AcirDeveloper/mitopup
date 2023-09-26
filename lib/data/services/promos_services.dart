import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../data.dart';

class PromosServices {
  static final dio = Dio(BaseOptions(baseUrl: Environment.url));

  static Future<List<PromosEntity>> fetchPromos(String idUser) async {
    try {
      final response = await dio.get('/app.getPromos', queryParameters: {
        'idUser': idUser,
      });
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        List<PromosEntity> promosData = [];
        for (var promo in data) {
          final bgColor = promo['bgColor']?.toString() ?? '';
          final iconPromo = promo['icon']?.toString() ?? '';
          final amount = promo['cantidad']?.toString() ?? '';
          final description = promo['descripcion']?.toString() ?? '';
          final validity = promo['validez']?.toString() ?? '';
          final firstTime = promo['activa']?.toString() ?? '';
          final isActive = promo['activa']?.toString() ?? '';
          final idPromo = promo['idPromo']?.toString() ?? '';

          promosData.add(PromosEntity(
            bgColor: bgColor,
            idPromo: idPromo,
            iconPromo: iconPromo,
            amount: amount,
            description: description,
            validity: validity,
            firstTime: firstTime == '1' ? true : false,
            isActive: isActive == '1' ? true : false,
          ));
        }

        return promosData;
      } else {
        throw Exception('Error getting contacts from webservice');
      }
    } catch (e) {
      throw Exception('Error fetching contacts: $e');
    }
  }
}
