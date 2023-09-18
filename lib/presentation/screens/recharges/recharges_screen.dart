// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/config/modals/show_register_sheet.dart';

import '../../../data/data.dart';
import '../../../generated/l10n.dart';
import '../screens.dart';

class RechargesScreen extends StatefulWidget {
  const RechargesScreen({super.key});

  @override
  State<RechargesScreen> createState() => RechargesScreenState();
}

class RechargesScreenState extends State<RechargesScreen>
    with SingleTickerProviderStateMixin {
  CountryEntity? selectedCountry;
  List<CountryEntity> countries = [];
  TextEditingController phoneNumberController = TextEditingController();
  bool isPhoneNumberFilled = false;
  late Animation<Offset> slideAnimation;
  late AnimationController animationController;
  late Animation<Offset> logoOffset;
  late Animation<double> animation;
  bool isBottomSheetOpen = false;
  int bottomSheetContextIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchSelectedCountry(1);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0),
    ).animate(animationController);
    logoOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> fetchSelectedCountry(int countryId) async {
    try {
      final fetchedCountry =
          await CountryServices.fetchSelectedCountry(countryId);
      setState(() {
        selectedCountry = fetchedCountry;
      });
    } catch (error) {
      // Manejar el error aquí
      print('Error: $error');
    }
  }

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
                            capitalize(Literals.of(context).textFlow4_1),
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
                                capitalize(
                                    Literals.of(context).textPhoneRecharge),
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
                                  onPressed: _openCountrySelectionPage,
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
                                    minimumSize:
                                        const Size(double.infinity, 60.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (selectedCountry?.flag != null &&
                                          selectedCountry?.flag != '')
                                        Image.network(
                                          selectedCountry?.flag ?? '',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        selectedCountry?.countryCode ?? '',
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
                                  controller: phoneNumberController,
                                  onChanged: (value) {
                                    _checkPhoneNumberField();
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
                              onPressed: () {},
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
                              isFilled: true,
                              onPressed: () {
                                Navigator.pop(context);
                                showRegisterModal(
                                  context,
                                  () {},
                                  updateBottomSheetContextIndex,
                                  slideAnimation,
                                  animationController,
                                );
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
                                Navigator.pop(context);
                                showGetInto(
                                  context,
                                  () {},
                                  updateBottomSheetContextIndex,
                                  slideAnimation,
                                  animationController,
                                );
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

  void updateBottomSheetState(bool isBottomSheetOpen) {
    setState(() {
      isBottomSheetOpen = false;
    });
  }

  void updateBottomSheetContextIndex(int newIndex) {
    setState(() {
      bottomSheetContextIndex = newIndex;
    });
  }

  void showFinalImage(String imageUrl) {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          selectedCountry?.flag = imageUrl;
        });
      }
    });
  }

  void _openCountrySelectionPage() async {
    final selected = await Navigator.push<CountryEntity>(
      context,
      MaterialPageRoute(
        builder: (context) => CountrySelectionScreen(
          countries: countries,
          selectedCountry: selectedCountry,
        ),
      ),
    );
    if (selected != null) {
      fetchSelectedCountry(selected.idCountry);
    }
  }

  void _checkPhoneNumberField() {
    final phoneNumber =
        phoneNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final previousSelection = phoneNumberController.selection;
    setState(() {
      final requiredDigits = selectedCountry?.digits ?? 0;
      isPhoneNumberFilled = phoneNumber.length >= requiredDigits;
      phoneNumberController.text = phoneNumber;
    });
    phoneNumberController.selection = previousSelection;
  }

  void _navigateToLogin() {
    final String idPais = selectedCountry?.idCountry.toString() ?? '';
    final String phoneNumber = phoneNumberController.text;
    // Simulación de recarga realizada
    print('Recarga realizada para el país $idPais y número $phoneNumber');
  }
}
