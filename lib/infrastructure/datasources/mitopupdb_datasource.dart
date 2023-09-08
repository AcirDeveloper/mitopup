import 'package:mitopup/domain/datasources/mitopup_datasource.dart';
import 'package:mitopup/domain/entities/entities.dart';

class MitopupdbDatasource extends ContactsDataSource {
  @override
  Future<List<ContactEntity>> getContacts() async {
    return [];
  }
}
