import 'package:mitopup/config/constants/environment.dart';
import 'package:mitopup/data/entities/help_entity.dart';
import 'package:dio/dio.dart';

import '../model/help_model.dart';

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
