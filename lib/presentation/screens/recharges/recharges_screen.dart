import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/presentation/screens/auth/login_screen.dart';
import 'package:mitopup/presentation/screens/dashboard/dashboard.dart';

import '../../../config/theme/buttons.dart';
import '../../../config/theme/others.dart';
import '../../../generated/l10n.dart';

class RechargesScreen extends StatefulWidget {
  const RechargesScreen({super.key});

  @override
  State<RechargesScreen> createState() => _RechargesScreenState();
}

class _RechargesScreenState extends State<RechargesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Literals.of(context).textFlow4_1,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#34405F"),
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Literals.of(context).btnCel,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor("#34405F"),
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  //_openCountrySelectionPage,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(8.0),
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    side: BorderSide(
                                      width: 1,
                                      color: HexColor("#D2D5DA"),
                                    ),
                                    elevation: 0,
                                    minimumSize: const Size(double.infinity,
                                        60.0), // Aumenta la altura del botón
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'http://5.78.79.129:8080/files/106-1-bandera/mex.png',
                                        // selectedCountry?.flagUrl ?? '',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'ES',
                                        // selectedCountry?.code ?? '',
                                        style: TextStyle(
                                          color: HexColor("#34405F"),
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: HexColor(
                                            "#34405F"), // Cambia el color del icono
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  controller: SearchController(),
                                  // phoneNumberController,
                                  onChanged: (value) {
                                    // _checkPhoneNumberField();
                                  },
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    hintText:
                                        Literals.of(context).loginPlaceholder,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: HexColor("#D2D5DA"),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: HexColor("#0743DF"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          SizedBox(
                            width: double.infinity,
                            child: OutlineButton(
                              onPressed: () {
                                GoRouter.of(context).pushNamed(Dashboard.name);
                              },
                              buttonText:
                                  capitalize(Literals.of(context).btnBegin),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 2,
                                    color: HexColor("#DBDBDB"),
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 15),
                                    child: Text(
                                      Literals.of(context).or,
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: HexColor("#DBDBDB")),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 2,
                                    color: HexColor("#DBDBDB"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            child: BlueButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(LoginScreen.name);
                              },
                              buttonText:
                                  capitalize(Literals.of(context).btnRegister),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: WhiteButton(
                              onPressed: () {
                                GoRouter.of(context).push(LoginScreen.name);
                              },
                              buttonText: Literals.of(context).btnGetInto,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
