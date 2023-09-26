class ContactEntity {
  final int? idContact;
  final String nameContact;
  final String codeCountry;
  final String phoneContact;
  final int? idUser;
  final String colorContact;

  ContactEntity({
    this.idContact,
    required this.nameContact,
    required this.codeCountry,
    required this.phoneContact,
    this.idUser,
    required this.colorContact,
  });
}
