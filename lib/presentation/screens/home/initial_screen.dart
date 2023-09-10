import 'package:flutter/material.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:mitopup/presentation/widgets/personal/initial_slide_widget.dart';

import '../../../config/helpers/show_language_bottom_sheet.dart';

class InitialScreen extends StatefulWidget {
  final String? selectedLanguage;
  final Function(String)? changeLanguage;

  const InitialScreen({
    super.key,
    this.selectedLanguage,
    this.changeLanguage,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> logoOffset;
  bool isBottomSheetOpen = false;
  int bottomSheetContextIndex = 0;

  void updateBottomSheetState() {
    setState(() {
      isBottomSheetOpen = false;
    });
  }

  void updateBottomSheetContextIndex(int newIndex) {
    setState(() {
      bottomSheetContextIndex = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0),
    ).animate(_animationController);
    logoOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showLanguageBottomSheet(
                      context,
                      updateBottomSheetState,
                      updateBottomSheetContextIndex,
                      _slideAnimation,
                      _animationController,
                      'Mexico (MX)',
                      (selectedLanguage) {},
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.selectedLanguage ?? 'Mexico (MX)',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Ayuda
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        capitalize(Literals.of(context).help),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 200,
            // top: isBottomSheetOpen ? 130 : 450,
          ),
          child: InitialSlideWidget(
            animationController: _animationController,
            slideAnimation: _slideAnimation,
            updateBottomSheetContextIndex: updateBottomSheetContextIndex,
            updateParentState: () {},
          ),
        ),
      ),
    );
  }
}
