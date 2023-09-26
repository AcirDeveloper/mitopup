import 'package:flutter/cupertino.dart';

class PromosEntity {
  final String idPromo;
  final String bgColor;
  final String iconPromo;
  final String amount;
  final String description;
  final String validity;
  final bool firstTime;
  final bool isActive;

  PromosEntity({
    required this.idPromo,
    required this.bgColor,
    required this.iconPromo,
    required this.amount,
    required this.description,
    required this.validity,
    required this.firstTime,
    required this.isActive,
  });
}
