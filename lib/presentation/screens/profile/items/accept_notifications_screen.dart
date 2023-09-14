import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../config/theme/buttons.dart';
import '../../../../config/theme/images.dart';
import '../../../../config/theme/others.dart';
import '../../../../domain/data.dart';
import '../../../../generated/l10n.dart';
import '../../../widgets/buttons/language_button.dart';

class AcceptNotificationsScreen extends StatelessWidget {
  const AcceptNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: const _AcceptNotificationView(),
    );
  }
}

class _AcceptNotificationView extends StatefulWidget {
  const _AcceptNotificationView();

  @override
  State<_AcceptNotificationView> createState() =>
      _AcceptNotificationViewState();
}

class _AcceptNotificationViewState extends State<_AcceptNotificationView> {
  bool isDeveloper = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Recibir notificaciones'),
                value: isDeveloper,
                onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                }),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: HexColor('#dbdbdb'), width: 2)),
                ),
              ),
              ExpansionTile(
                title: Text('Idioma'),
                subtitle: Text('Español (MX)'),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: HexColor('#dbdbdb'), width: 2)),
                    ),
                    child: LanguageButton(
                      customButton: CustomLanguageButton(
                        flagAsset: AppImages.mexico,
                        language: 'Español',
                        languageShort: 'MX',
                        isSelected: false,
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  LanguageButton(
                    customButton: CustomLanguageButton(
                      flagAsset: AppImages.usa,
                      language: 'English',
                      languageShort: 'US',
                      isSelected: false,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 30.0),
          child: BlueButton(
            onPressed: () {
              saveLanguageAndPop();
            },
            buttonText: capitalize(Literals.of(context).save),
          ),
        ),
      ],
    );
  }

  void saveLanguageAndPop() {
    Navigator.pop(context);
  }
}
