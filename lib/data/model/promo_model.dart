class PromoModel {
  String bgColor;
  String imageUrl;
  String cantidad;
  String descripcion;
  String validez;
  String idPromo;

  PromoModel({
    required this.bgColor,
    required this.imageUrl,
    required this.cantidad,
    required this.descripcion,
    required this.validez,
    required this.idPromo,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
        bgColor: json["bgColor"],
        imageUrl: json["imageUrl"],
        cantidad: json["cantidad"],
        descripcion: json["descripcion"],
        validez: json["validez"],
        idPromo: json["idPromo"],
      );

  Map<String, dynamic> toJson() => {
        "bgColor": bgColor,
        "imageUrl": imageUrl,
        "cantidad": cantidad,
        "descripcion": descripcion,
        "validez": validez,
        "idPromo": idPromo,
      };
}
