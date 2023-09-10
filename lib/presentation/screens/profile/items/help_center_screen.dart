import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/entities/help_entity.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _HelpCenterViewScreen();
  }
}

class _HelpCenterViewScreen extends ConsumerStatefulWidget {
  const _HelpCenterViewScreen({
    super.key,
  });

  @override
  _HelpCenterViewScreenState createState() => _HelpCenterViewScreenState();
}

class _HelpCenterViewScreenState extends ConsumerState<_HelpCenterViewScreen> {
  List<HelpEntity> helpEntities = [];
  List<bool> isExpandedList = [];

  @override
  void initState() {
    super.initState();
    getHelps();
  }

  Future<void> getHelps() async {
    final response =
        await Dio().get('http://5.78.79.129:8080/app.getFaqs?idioma=es');
    final List<dynamic> helpList = response.data;

    if (helpList.isNotEmpty) {
      // Mapea la lista de respuestas JSON a objetos HelpEntity
      final List<HelpEntity> helpEntitiesList = helpList.map((helpJson) {
        return HelpEntity(
          titleHelp: helpJson['pregunta'],
          descriptionHelp: helpJson['respuesta'],
        );
      }).toList();

      // Inicializa la lista de estados como falsos
      isExpandedList = List.generate(helpEntitiesList.length, (index) => false);

      setState(() {
        helpEntities = helpEntitiesList;
      });
    }
  }

  void toggleExpansion(int index) {
    setState(() {
      for (int i = 0; i < isExpandedList.length; i++) {
        if (i == index) {
          isExpandedList[i] = !isExpandedList[i];
        } else {
          isExpandedList[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de Ayuda'),
      ),
      body: ListView.builder(
        itemCount: helpEntities.length,
        itemBuilder: (context, index) {
          final helpEntity = helpEntities[index];

          return ExpansionTile(
            title: Text(helpEntity.titleHelp),
            onExpansionChanged: (bool isExpanded) {
              toggleExpansion(index);
            },
            initiallyExpanded: isExpandedList[index],
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(helpEntity.descriptionHelp),
              ),
            ],
          );
        },
      ),
    );
  }
}
