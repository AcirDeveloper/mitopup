import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String flagAsset;
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButton({
    required this.flagAsset,
    required this.language,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : Colors.transparent,
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      icon: Image.asset(
        flagAsset,
        width: 24,
        height: 24,
      ),
      label: Text(
        language,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          letterSpacing: 0.16,
          wordSpacing: 0,
        ),
      ),
    );
  }
}