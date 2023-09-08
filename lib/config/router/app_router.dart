import 'package:go_router/go_router.dart';
import 'package:mitopup/presentation/screens/home/home_page.dart';
import 'package:mitopup/presentation/screens/profile/items/accept_notifications_screen.dart';
import 'package:mitopup/presentation/screens/screens.dart';

import '../../presentation/screens/profile/items/help_center_screen.dart';
import '../../presentation/screens/profile/items/invite_friends_screen.dart';
import '../../presentation/screens/profile/items/language_screen.dart';
import '../../presentation/screens/profile/items/payment_methods_screen.dart';
import '../../presentation/screens/recharges/recargar.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => HomePage(
        selectedLanguage: '',
        changeLanguage: (String language) {},
      ),
    ),

    GoRoute(
      path: '/home',
      name: HomeDash.name,
      builder: (context, state) => HomeDash(
        changePage: (int id) {},
      ),
    ),

    GoRoute(
      path: '/recharges',
      name: RecargasDash.name,
      builder: (context, state) => const RecargasDash(
        userId: '',
      ),
    ),

    GoRoute(
      path: '/promos',
      builder: (context, state) => const PromosPage(),
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
      builder: (context, state) => const PerfilDash(),
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
      builder: (context, state) => const LangScreen(),
    ),

    // Rutas de recargas
    GoRoute(
      path: '/Mitopup/RecargasPage',
      builder: (context, state) => const RecargasPage(),
    )
  ],
);
