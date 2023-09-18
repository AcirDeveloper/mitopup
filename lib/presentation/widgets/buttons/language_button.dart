import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../data/data.dart';

class LanguageButton extends StatelessWidget {
  final CustomLanguageButton customButton;

  const LanguageButton({
    super.key,
    required this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: customButton.onTap,
      child: Container(
        width: double.infinity, // Ocupa el 100% de ancho
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  customButton.flagAsset,
                  width: 28,
                  height: 26,
                ),
                const SizedBox(width: 12),
                Text(
                  customButton.language,
                  style: TextStyle(
                    color: HexColor("#34405F"),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.16,
                    wordSpacing: 0,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  customButton.languageShort ?? '',
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
                border: Border(
                    bottom: BorderSide(color: HexColor('#dbdbdb'), width: 1)),
              ),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: customButton.isSelected ? Colors.blue : Colors.white,
                  border: Border.all(color: HexColor('#dbdbdb'), width: 1),
                ),
                child: customButton.isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
