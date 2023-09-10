class HelpDbResponseModel {
  final int? idHelp;
  final String titleHelp;
  final String descriptionHelp;
  final String? languageHelp;
  final int? numberOrderHelp;

  HelpDbResponseModel({
    this.idHelp,
    required this.titleHelp,
    required this.descriptionHelp,
    this.languageHelp,
    this.numberOrderHelp,
  });

  factory HelpDbResponseModel.fromJson(Map<String, dynamic> json) =>
      HelpDbResponseModel(
        idHelp: json["idFaq"],
        titleHelp: json["pregunta"],
        descriptionHelp: json["respuesta"],
        languageHelp: json["idioma"],
        numberOrderHelp: json["orden"],
      );

  Map<String, dynamic> toJson() => {
        "idHelp": idHelp,
        "titleHelp": titleHelp,
        "descriptionHelp": descriptionHelp,
        "languageHelp": languageHelp,
        "numberOrderHelp": numberOrderHelp,
      };
}
