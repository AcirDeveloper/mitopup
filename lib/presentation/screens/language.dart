import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/presentation/users/contacts.dart';
import 'package:mitopup/presentation/users/dashboard.dart';
import 'package:mitopup/presentation/users/notifications.dart';


class LangPage extends StatefulWidget {
  @override
  _LangPageState createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  String _selectedLanguage = 'Español (MX)';

  void _saveLanguageAndPop() {
    Navigator.pop(context, _selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lightAppBarAyuda(
        title: Literals.of(context).idioma,
        leadingOnPressed: () {
          // Implementa la lógica para cancelar y volver a la página anterior
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: HexColor('#dbdbdb'), width: 1)),
                    ),
                    child: LanguageButton(
                      flagAsset: 'assets/images/mex.png',
                      language: 'Español',
                      languageCorto: 'MX',
                      isSelected: _selectedLanguage == 'Español (MX)',
                      onTap: () {
                        setState(() {
                          _selectedLanguage = 'Español (MX)';
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: HexColor('#dbdbdb'), width: 1)),
                    ),
                    child: LanguageButton(
                      flagAsset: 'assets/images/usa.png',
                      language: 'English',
                      languageCorto: 'US',
                      isSelected: _selectedLanguage == 'English (US)',
                      onTap: () {
                        setState(() {
                          _selectedLanguage = 'English (US)';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Aquí empiezan los botones falsos
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 30.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard(userId: "4")),
                      );
                    },
                    child: Text('Dashboard'),
                  ),

                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notificaciones()),
                      );
                    },
                    child: Text('notificaciones'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contactos()),
                      );
                    },
                    child: Text('contactos'),
                  ),
                ],
              ),
            ),
            //HAsta aquí llegan los botones falsos
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 30.0),
              child: BlueButton(
                onPressed: () {
                  _saveLanguageAndPop();
                },
                buttonText: capitalize(Literals.of(context).guardar),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String flagAsset;
  final String language;
  final String languageCorto;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButton({
    required this.flagAsset,
    required this.language,
    required this.languageCorto,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Ocupa el 100% de ancho
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  flagAsset,
                  width: 28,
                  height: 26,
                ),
                SizedBox(width: 12),
                Text(
                  language,
                  style: TextStyle(
                    color: HexColor("#34405F"),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.16,
                    wordSpacing: 0,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  languageCorto,
                  style: TextStyle(
                    color: HexColor("#888888"),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.16,
                    wordSpacing: 0,
                  ),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: HexColor('#dbdbdb'), width: 1)),
              ),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.blue : Colors.white,
                  border: Border.all(color: HexColor('#dbdbdb'), width: 1),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}