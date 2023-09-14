class RechargesEntity {
  final String idRecharge;
  final String codeRecharge;
  final int idUser;
  final double amount;
  final String codeCountry;
  final String phoneRecharge;
  final int operator;
  final int frequency;
  final double discount;
  final bool paid;
  final double paidTotal;
  final String nameDest;
  final String countryRecharge;
  final String typeRecharge;
  final String lastPaymentDigits;
  final bool isActive;
  final int idMethodPaid;
  final int idOrigin;
  final String userAgent;
  final int idProduct;
  final String emailRecharge;
  final String date;
  final String contact;

  RechargesEntity({
    required this.idRecharge,
    required this.codeRecharge,
    required this.idUser,
    required this.amount,
    required this.codeCountry,
    required this.phoneRecharge,
    required this.operator,
    required this.frequency,
    required this.discount,
    required this.paid,
    required this.paidTotal,
    required this.nameDest,
    required this.countryRecharge,
    required this.typeRecharge,
    required this.lastPaymentDigits,
    required this.isActive,
    required this.idMethodPaid,
    required this.idOrigin,
    required this.userAgent,
    required this.idProduct,
    required this.emailRecharge,
    required this.date,
    required this.contact,
  });
}
