import 'package:go_router/go_router.dart';
import 'package:mitopup/presentation/screens/screens.dart';
import 'package:mitopup/presentation/widgets/widgets.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InitialScreen(),
    ),

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/login/pin/:phoneNumber/:idPais',
      name: PinScreen.name,
      builder: (context, state) => PinScreen(
        phoneNumber: state.pathParameters['phoneNumber']!,
        idPais: state.pathParameters['idPais']!,
      ),
    ),

    GoRoute(
      path: '/dashboard',
      name: Dashboard.name,
      builder: (context, state) => const Dashboard(),
    ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),

    GoRoute(
      path: '/help/form',
      builder: (context, state) => const HelpFormScreen(),
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
      name: HelpCenterScreen.name,
      builder: (context, state) => const HelpCenterScreen(),
    ),
    GoRoute(
      path: '/profile/accept_notifications',
      builder: (context, state) => const AcceptNotificationsScreen(),
    ),
    GoRoute(
      path: '/profile/language',
      builder: (context, state) => const LanguageSelectorBottomSheet(),
    ),

    // Rutas de recargas
    GoRoute(
      path: '/Mitopup/RecargasPage',
      builder: (context, state) => const ContactForm(),
    )
  ],
);
