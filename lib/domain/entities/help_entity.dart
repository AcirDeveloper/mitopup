class HelpEntity {
  final int? idHelp;
  final String titleHelp;
  final String descriptionHelp;
  final String? languageHelp;
  final int? numberOrderHelp;

  HelpEntity({
    this.idHelp,
    required this.titleHelp,
    required this.descriptionHelp,
    this.languageHelp,
    this.numberOrderHelp,
  });
}
