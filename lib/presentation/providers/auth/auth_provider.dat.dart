import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mitopup/domain/data.dart';
import 'package:mitopup/infrastructure/infrastructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(AuthState());

  Future<void> loginUser(
      String codeCountry, String phone, int pinAccess) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(codeCountry, phone, pinAccess);
      _setLoggerUser(user);
    } on WrongCredentials {
      logout('Incorrect credentials');
    } catch (error) {
      logout('Unhandled error');
    }
  }

  void registerUser(String telefono, String codPais, String pin) async {}

  void checkAuthUser() async {}

  void _setLoggerUser(UsersEntity user) {
    // Todo: necesito guardar el token fisicamente
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      user: user,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    // Todo: limpiar token
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final UsersEntity? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    UsersEntity? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
