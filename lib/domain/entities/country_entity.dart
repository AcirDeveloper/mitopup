class CountryEntity {
  final int id;
  final String name;
  final String code;
  final String flagUrl;
  final int digits;

  CountryEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.digits,
    required this.flagUrl,
  });
}
