import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../config/config.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String? previousMonthYear;

  // List<NotificationsEntity> NotificationsScreen = [
  //   NotificationsEntity(
  //     message: "23/03/2023 14:05",
  //     title: "Tarjeta caducada",
  //     message: "Actualiza los datos o borra esta tarjeta",
  //   ),
  //   NotificationsEntity(
  //     message: "25/03/2023 14:05",
  //     title: "Recarga automática realizada",
  //     message: "Recarga mensual de Plan amigo  a Mamá",
  //   ),
  //   NotificationsEntity(
  //     message: "15/05/2023 14:05",
  //     title: "Tarjeta caducada",
  //     message: "Actualiza los datos o borra esta tarjeta",
  //   ),
  //   NotificationsEntity(
  //     message: "13/05/2023 14:05",
  //     title: "Recarga automática realizada",
  //     message: "Recarga mensual de Plan amigo  a Mamá",
  //   ),
  //   NotificationsEntity(
  //     message: "13/05/2023 14:05",
  //     title: "Recarga automática realizada",
  //     message: "Recarga mensual de Plan amigo  a Mamá",
  //   ),
  //   NotificationsEntity(
  //     message: "13/05/2023 14:05",
  //     title: "Recarga automática realizada",
  //     message: "Recarga mensual de Plan amigo  a Mamá",
  //   ),
  //   NotificationsEntity(
  //     message: "13/05/2023 14:05",
  //     title: "Recarga automática realizada",
  //     message: "Recarga mensual de Plan amigo  a Mamá",
  //   ),
  //   // Agrega más NotificationsScreen aquí...
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: Literals.of(context).notifications,
        leadingOnPressed: () {
          // Implementa la lógica para cancelar y volver a la página anterior
          Navigator.pop(context);
        },
      ),
      body: Container(
        color: Colors.white,
        // child: ListView.separated(
        //   itemCount: ,
        //   itemBuilder: (context, index) {
        //     NotificationsEntity notificacion = NotificationsScreen[index];
        //
        //     // Verificar si el mes y año actual es diferente al mes y año anterior
        //     bool showSeparator =
        //         previousMonthYear != getMonthTitle(notificacion.message);
        //     // Actualizar el mes y año anterior con el mes y año actual
        //     previousMonthYear = getMonthTitle(notificacion.message);
        //
        //     return Column(
        //       children: [
        //         // Mostrar el separador si es diferente al mes y año anterior
        //         if (showSeparator)
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(35, 40, 35, 0),
        //             child: Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 capitalize(getMonthTitle(notificacion.message)),
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20,
        //                   color: HexColor("#34405F"),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         // Mostrar la notificación
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        //           child: Card(
        //             shape: const RoundedRectangleBorder(
        //               borderRadius: BorderRadius.only(
        //                 bottomLeft: Radius.circular(4.0),
        //                 bottomRight: Radius.circular(4.0),
        //               ),
        //             ),
        //             child: Padding(
        //               padding: const EdgeInsets.fromLTRB(25, 15, 0, 15),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Row(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             notificacion.message,
        //                             style: TextStyle(
        //                               fontWeight: FontWeight.w400,
        //                               fontSize: 12,
        //                               color: HexColor("#888888"),
        //                               height: 1.2,
        //                             ),
        //                           ),
        //                           Text(
        //                             notificacion.title,
        //                             style: TextStyle(
        //                               fontWeight: FontWeight.w400,
        //                               fontSize: 16,
        //                               height: 2,
        //                               color: HexColor("#34405F"),
        //                             ),
        //                           ),
        //                           Text(
        //                             notificacion.message,
        //                             style: TextStyle(
        //                               fontWeight: FontWeight.w400,
        //                               fontSize: 14,
        //                               height: 1.6,
        //                               color: HexColor("#888888"),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   Container(
        //                     padding: const EdgeInsets.all(0.0),
        //                     child: IconButton(
        //                       onPressed: () {
        //                         // Llamar al método changePage pasando el índice 1 para "Recargas"
        //                       },
        //                       icon: const Icon(Icons.chevron_right),
        //                       iconSize: 40,
        //                       color: HexColor("#34405F"),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        //   separatorBuilder: (context, index) => const SizedBox.shrink(),
        // ),
      ),
    );
  }

  String getMonthTitle(String fecha) {
    // Función para obtener el nombre completo del mes y año a partir de la fecha en formato "dd/MM/yyyy HH:mm"
    // Retorna el nombre completo del mes y año en español, ej: "marzo de 2023"

    // Primero, parseamos la fecha en formato "dd/MM/yyyy HH:mm" a un objeto DateTime
    DateTime messageTime = DateFormat("dd/MM/yyyy HH:mm").parse(fecha);

    // Luego, utilizamos la clase DateFormat para formatear el nombre completo del mes y año en español
    String monthTitle = DateFormat("MMMM 'de' y", 'es_ES').format(messageTime);

    return monthTitle;
  }
}
