import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../data/data.dart';

class PromosCardItem extends StatelessWidget {
  final PromosEntity cardData;

  const PromosCardItem({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Lógica para manejar el tap en la tarjeta de promoción (opcional)
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor(cardData.bgColor),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Center(
          child: Row(
            children: [
              // Primera Columna (Imagen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    cardData.iconPromo, // Mostrar la imagen desde la URL
                    width: 64,
                    height: 64,
                  ),
                ],
              ),

              // Segunda Columna (Cantidad, Descripción y Validez)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          cardData.amount,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 0,
                            color: HexColor("#34405F"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Agregamos un espacio entre la cantidad y la descripción
                        Expanded(
                          child: Text(
                            cardData.description,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: 0,
                              color: HexColor("#34405F"),
                            ),
                            maxLines: 2,
                            // Establecemos el máximo de líneas para evitar el desbordamiento
                            overflow: TextOverflow
                                .ellipsis, // Agregamos la elipsis (...) para mostrar que hay más texto
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Agregamos un espacio entre la descripción y la validez
                    Text(
                      cardData.validity,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0,
                        color: HexColor("#34405F"),
                      ),
                    ),
                  ],
                ),
              ),
              // Tercera Columna (Icono de Chevron)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: HexColor("#34405F"),
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
