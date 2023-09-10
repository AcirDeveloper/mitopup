import 'package:go_router/go_router.dart';
import 'package:mitopup/presentation/screens/home/initial_screen.dart';
import 'package:mitopup/presentation/screens/profile/items/accept_notifications_screen.dart';
import 'package:mitopup/presentation/screens/screens.dart';

import '../../presentation/screens/profile/items/help_center_screen.dart';
import '../../presentation/screens/profile/items/invite_friends_screen.dart';
import '../../presentation/screens/profile/items/language_screen.dart';
import '../../presentation/screens/profile/items/payment_methods_screen.dart';
import '../../presentation/widgets/tests/example_form.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialScreen(),
    ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => const Notificaciones(),
    ),

    GoRoute(
      path: '/help',
      builder: (context, state) => const CentroAyudaPage(),
    ),

    GoRoute(
      path: '/help/form',
      builder: (context, state) => const AyudaForm(),
    ),

    // Rutas de perfil
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/profile/edit_info',
      builder: (context, state) => const EditInfoScreen(),
    ),
    GoRoute(
      path: '/profile/change_pin',
      builder: (context, state) => const ChangePinScreen(),
    ),
    GoRoute(
      path: '/profile/invite_friends',
      builder: (context, state) => const InviteFriendsScreen(),
    ),
    GoRoute(
      path: '/profile/payment_methods',
      builder: (context, state) => const PaymentMethodsScreen(),
    ),
    GoRoute(
      path: '/profile/help_center',
      builder: (context, state) => const HelpCenterScreen(),
    ),
    GoRoute(
      path: '/profile/accept_notifications',
      builder: (context, state) => const AcceptNotificationsScreen(),
    ),
    GoRoute(
      path: '/profile/language',
      builder: (context, state) => LanguageSelectorBottomSheet(
        selectedLanguage: 'ES',
        changeLanguage: (String p1) {},
      ),
    ),

    // Rutas de recargas
    GoRoute(
      path: '/Mitopup/RecargasPage',
      builder: (context, state) => const ContactForm(),
    )
  ],
);
