import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/data.dart';

class HelpCenterScreen extends StatelessWidget {
  static const String name = 'center-help';

  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HelpCenterViewScreen();
  }
}

class _HelpCenterViewScreen extends ConsumerStatefulWidget {
  const _HelpCenterViewScreen();

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
    final getListsHelps = await HelpServices.getListHelps();
    isExpandedList = List.generate(getListsHelps.length, (index) => false);

    setState(() {
      helpEntities = getListsHelps;
    });
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
