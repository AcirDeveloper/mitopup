// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Literals {
  Literals();

  static Literals? _current;

  static Literals get current {
    assert(_current != null,
        'No instance of Literals was loaded. Try to initialize the Literals delegate before accessing Literals.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Literals> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Literals();
      Literals._current = instance;

      return instance;
    });
  }

  static Literals of(BuildContext context) {
    final instance = Literals.maybeOf(context);
    assert(instance != null,
        'No instance of Literals present in the widget tree. Did you add Literals.delegate in localizationsDelegates?');
    return instance!;
  }

  static Literals? maybeOf(BuildContext context) {
    return Localizations.of<Literals>(context, Literals);
  }

  /// `es`
  String get _locale {
    return Intl.message(
      'es',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `Recarga los teléfonos de tus seres queridos de forma rápida, segura y sencilla.`
  String get homeMainText {
    return Intl.message(
      'Recarga los teléfonos de tus seres queridos de forma rápida, segura y sencilla.',
      name: 'homeMainText',
      desc: '',
      args: [],
    );
  }

  /// `comenzar`
  String get btnStart {
    return Intl.message(
      'comenzar',
      name: 'btnStart',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get btnGetInto {
    return Intl.message(
      'Ingresar',
      name: 'btnGetInto',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar sesión`
  String get btnLogin {
    return Intl.message(
      'Iniciar sesión',
      name: 'btnLogin',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get help {
    return Intl.message(
      'Ayuda',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get language {
    return Intl.message(
      'Idioma',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get btnNext {
    return Intl.message(
      'Siguiente',
      name: 'btnNext',
      desc: '',
      args: [],
    );
  }

  /// `Saltar`
  String get btnJump {
    return Intl.message(
      'Saltar',
      name: 'btnJump',
      desc: '',
      args: [],
    );
  }

  /// `Registrarse`
  String get btnRegister {
    return Intl.message(
      'Registrarse',
      name: 'btnRegister',
      desc: '',
      args: [],
    );
  }

  /// `Hacer Recarga`
  String get btnTopUp {
    return Intl.message(
      'Hacer Recarga',
      name: 'btnTopUp',
      desc: '',
      args: [],
    );
  }

  /// `Servicio internacional`
  String get flow1_1 {
    return Intl.message(
      'Servicio internacional',
      name: 'flow1_1',
      desc: '',
      args: [],
    );
  }

  /// `Envía recargas al celular de cualquier país estés donde estés.`
  String get flow1_2 {
    return Intl.message(
      'Envía recargas al celular de cualquier país estés donde estés.',
      name: 'flow1_2',
      desc: '',
      args: [],
    );
  }

  /// `Fácil y rápido`
  String get flow2_1 {
    return Intl.message(
      'Fácil y rápido',
      name: 'flow2_1',
      desc: '',
      args: [],
    );
  }

  /// `Recarga los celulares de tu familia en 3 simples pasos.`
  String get flow2_2 {
    return Intl.message(
      'Recarga los celulares de tu familia en 3 simples pasos.',
      name: 'flow2_2',
      desc: '',
      args: [],
    );
  }

  /// `Seguro y confiable`
  String get flow3_1 {
    return Intl.message(
      'Seguro y confiable',
      name: 'flow3_1',
      desc: '',
      args: [],
    );
  }

  /// `Los pagos se realizan a través de un entorno protegido y seguro.`
  String get flow3_2 {
    return Intl.message(
      'Los pagos se realizan a través de un entorno protegido y seguro.',
      name: 'flow3_2',
      desc: '',
      args: [],
    );
  }

  /// `¿A quién le vas a enviar la recarga?`
  String get flow4_1 {
    return Intl.message(
      '¿A quién le vas a enviar la recarga?',
      name: 'flow4_1',
      desc: '',
      args: [],
    );
  }

  /// `recargar celular`
  String get btnCel {
    return Intl.message(
      'recargar celular',
      name: 'btnCel',
      desc: '',
      args: [],
    );
  }

  /// `Introduce el número`
  String get form_num {
    return Intl.message(
      'Introduce el número',
      name: 'form_num',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar recarga`
  String get btnTopUpC {
    return Intl.message(
      'Iniciar recarga',
      name: 'btnTopUpC',
      desc: '',
      args: [],
    );
  }

  /// `País del celular`
  String get country {
    return Intl.message(
      'País del celular',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Buscar país`
  String get search_country {
    return Intl.message(
      'Buscar país',
      name: 'search_country',
      desc: '',
      args: [],
    );
  }

  /// `Centro de ayuda`
  String get helpTitle {
    return Intl.message(
      'Centro de ayuda',
      name: 'helpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Formulario de contacto`
  String get formHelp {
    return Intl.message(
      'Formulario de contacto',
      name: 'formHelp',
      desc: '',
      args: [],
    );
  }

  /// `Mas información`
  String get plusHelp {
    return Intl.message(
      'Mas información',
      name: 'plusHelp',
      desc: '',
      args: [],
    );
  }

  /// `Contáctanos`
  String get contactUs {
    return Intl.message(
      'Contáctanos',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Por favor rellena el formulario.`
  String get fromTitle {
    return Intl.message(
      'Por favor rellena el formulario.',
      name: 'fromTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get formName {
    return Intl.message(
      'Nombre',
      name: 'formName',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu nombre`
  String get formNamePlaceholder {
    return Intl.message(
      'Escribe tu nombre',
      name: 'formNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu nombre`
  String get formNameError {
    return Intl.message(
      'Por favor, escribe tu nombre',
      name: 'formNameError',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get formEmail {
    return Intl.message(
      'Correo electrónico',
      name: 'formEmail',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu correo electrónico`
  String get formEmailPlaceholder {
    return Intl.message(
      'Escribe tu correo electrónico',
      name: 'formEmailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu correo electrónico`
  String get formEmailError {
    return Intl.message(
      'Por favor, escribe tu correo electrónico',
      name: 'formEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Mensaje`
  String get formMessage {
    return Intl.message(
      'Mensaje',
      name: 'formMessage',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu mensaje`
  String get formMessagePlaceholder {
    return Intl.message(
      'Escribe tu mensaje',
      name: 'formMessagePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu mensaje`
  String get formMessageError {
    return Intl.message(
      'Por favor, escribe tu mensaje',
      name: 'formMessageError',
      desc: '',
      args: [],
    );
  }

  /// `Adjuntar archivo`
  String get formAttach {
    return Intl.message(
      'Adjuntar archivo',
      name: 'formAttach',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get formSend {
    return Intl.message(
      'Enviar',
      name: 'formSend',
      desc: '',
      args: [],
    );
  }

  /// `Formulario enviado`
  String get successTitle {
    return Intl.message(
      'Formulario enviado',
      name: 'successTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nos pondremos en contacto con usted por correo electrónico lo antes posible.`
  String get successLead {
    return Intl.message(
      'Nos pondremos en contacto con usted por correo electrónico lo antes posible.',
      name: 'successLead',
      desc: '',
      args: [],
    );
  }

  /// `Volver al inicio`
  String get successButton {
    return Intl.message(
      'Volver al inicio',
      name: 'successButton',
      desc: '',
      args: [],
    );
  }

  /// `Indique su número de móvil para iniciar sesión`
  String get loginTitle {
    return Intl.message(
      'Indique su número de móvil para iniciar sesión',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Introduce tu número de móvil`
  String get loginPlaceholder {
    return Intl.message(
      'Introduce tu número de móvil',
      name: 'loginPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Tú número de teléfono`
  String get loginHint {
    return Intl.message(
      'Tú número de teléfono',
      name: 'loginHint',
      desc: '',
      args: [],
    );
  }

  /// `o`
  String get or {
    return Intl.message(
      'o',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `recupera tu contraseña`
  String get titlePass {
    return Intl.message(
      'recupera tu contraseña',
      name: 'titlePass',
      desc: '',
      args: [],
    );
  }

  /// `Hola {name}!`
  String hello(Object name) {
    return Intl.message(
      'Hola $name!',
      name: 'hello',
      desc: '',
      args: [name],
    );
  }

  /// `Guardar`
  String get save {
    return Intl.message(
      'Guardar',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Contactos`
  String get contacts {
    return Intl.message(
      'Contactos',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Ver todo`
  String get verTodo {
    return Intl.message(
      'Ver todo',
      name: 'verTodo',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get bottomBar1 {
    return Intl.message(
      'Inicio',
      name: 'bottomBar1',
      desc: '',
      args: [],
    );
  }

  /// `Recargas`
  String get bottomBar2 {
    return Intl.message(
      'Recargas',
      name: 'bottomBar2',
      desc: '',
      args: [],
    );
  }

  /// `Promos`
  String get bottomBar3 {
    return Intl.message(
      'Promos',
      name: 'bottomBar3',
      desc: '',
      args: [],
    );
  }

  /// `Perfil`
  String get bottomBar4 {
    return Intl.message(
      'Perfil',
      name: 'bottomBar4',
      desc: '',
      args: [],
    );
  }

  /// `Recargas recientes`
  String get recentRecharges {
    return Intl.message(
      'Recargas recientes',
      name: 'recentRecharges',
      desc: '',
      args: [],
    );
  }

  /// `Agregar nuevo`
  String get addNew {
    return Intl.message(
      'Agregar nuevo',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  /// `Notificaciones`
  String get notifications {
    return Intl.message(
      'Notificaciones',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu código?`
  String get forgetCode {
    return Intl.message(
      '¿Olvidaste tu código?',
      name: 'forgetCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Literals> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Literals> load(Locale locale) => Literals.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
