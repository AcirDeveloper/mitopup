import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/data.dart';
import '../infrastructure.dart';

class HelpDBDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.url,
  ));

  @override
  Future<List<HelpEntity>> getHelp() async {
    final response = await dio.get('/app.getFaqs?idioma=es');
    final helpResponse = HelpDbResponseModel.fromJson(response.data);
    final List<HelpEntity> help = [
      HelpEntity(
        titleHelp: helpResponse.titleHelp,
        descriptionHelp: helpResponse.descriptionHelp,
      ),
    ];
    return help;
  }
}
