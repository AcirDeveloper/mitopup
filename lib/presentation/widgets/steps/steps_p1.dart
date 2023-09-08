import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:im_stepper/stepper.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../config/config.dart';

class StepsBottom extends StatefulWidget {
  final Function() onStep3Complete;

  const StepsBottom({super.key, required this.onStep3Complete});

  @override
  // ignore: library_private_types_in_public_api
  _StepsBottomState createState() => _StepsBottomState();
}

class _StepsBottomState extends State<StepsBottom> {
  int activeStep = 0;
  int totalSteps = 3;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                // subir los elementos para que no se vean cortados
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Padding(padding: EdgeInsets.only(
                        bottom: 1.0,
                      ),),
                      Center(
                        child: SingleChildScrollView(
                          child: _buildStepContent(activeStep),
                        ),
                      ),
                      if (activeStep < 3) ...[
                        const SizedBox(height: 20.0),
                        DotStepper(
                          dotCount: 3,
                          dotRadius: 8,
                          activeStep: activeStep,
                          shape: Shape.circle,
                          spacing: 10,
                          indicator: Indicator.worm,
                          fixedDotDecoration: FixedDotDecoration(
                            color: HexColor("#DBDBDB"),
                          ),
                          onDotTapped: (tappedDotIndex) {
                            setState(() {
                              activeStep = tappedDotIndex;
                            });
                          },
                          indicatorDecoration: IndicatorDecoration(
                            color: HexColor("#005CEE"),
                          ),
                          lineConnectorDecoration: const LineConnectorDecoration(
                            color: Colors.red,
                            strokeWidth: 2,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: nextButton(),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: skipButton(),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Los contenidos de las pantallas
  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.stepOne,
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                Literals.of(context).flow1_1,
                style: const TextStyle(
                  color: Color(0xFF34405F),
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.36,
                  wordSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Literals.of(context).flow1_2,
                  style: const TextStyle(
                    color: Color(0xFF34405F),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    wordSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      case 1:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.stepTwo,
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                Literals.of(context).flow2_1,
                style: const TextStyle(
                  color: Color(0xFF34405F),
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.36,
                  wordSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Literals.of(context).flow2_2,
                  style: const TextStyle(
                    color: Color(0xFF34405F),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    wordSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      case 2:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.stepThree,
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                Literals.of(context).flow3_1,
                style: const TextStyle(
                  color: Color(0xFF34405F),
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.36,
                  wordSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Literals.of(context).flow3_2,
                  style: const TextStyle(
                    color: Color(0xFF34405F),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    wordSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.stepOne,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 16),
              Text(
                Literals.of(context).flow1_1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                Literals.of(context).flow1_2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
    }
  }

  // Los botones
  Widget nextButton() {
    String buttonText = '';
    if (activeStep < totalSteps - 1) {
      buttonText = capitalize(Literals.of(context).btnNext);
    } else {
      buttonText = capitalize(Literals.of(context).btnRegister);
    }
    return ElevatedButton(
      onPressed: () {
        if (activeStep < totalSteps - 1) {
          setState(() {
            activeStep++;
          });
        } else {
          if (activeStep == 2) {
            widget
                .onStep3Complete(); // Mostrar "RecargasPage" en el BottomSheet
          }
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: HexColor("#005CEE"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          letterSpacing: 0.0017,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget skipButton() {
    String buttonText = '';
    if (activeStep < totalSteps - 1) {
      buttonText = capitalize(Literals.of(context).btnJump);
    } else {
      buttonText = capitalize(Literals.of(context).btnTopUp);
    }

    return ElevatedButton(
      onPressed: () {
        widget.onStep3Complete();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          letterSpacing: 0.0017,
          color: HexColor("#005CEE"),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
