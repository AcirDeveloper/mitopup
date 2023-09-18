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

  /// `Comenzar recarga`
  String get btnBegin {
    return Intl.message(
      'Comenzar recarga',
      name: 'btnBegin',
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
  String get btnHelp {
    return Intl.message(
      'Ayuda',
      name: 'btnHelp',
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

  /// `Idioma`
  String get btnLanguage {
    return Intl.message(
      'Idioma',
      name: 'btnLanguage',
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

  /// `recargar celular`
  String get btnCel {
    return Intl.message(
      'recargar celular',
      name: 'btnCel',
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

  /// `Iniciar recarga`
  String get btnTopUpC {
    return Intl.message(
      'Iniciar recarga',
      name: 'btnTopUpC',
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

  /// `Recarga los teléfonos de tus seres queridos de forma rápida, segura y sencilla.`
  String get homeMainText {
    return Intl.message(
      'Recarga los teléfonos de tus seres queridos de forma rápida, segura y sencilla.',
      name: 'homeMainText',
      desc: '',
      args: [],
    );
  }

  /// `Servicio internacional`
  String get textFlow1_1 {
    return Intl.message(
      'Servicio internacional',
      name: 'textFlow1_1',
      desc: '',
      args: [],
    );
  }

  /// `Envía recargas al celular de cualquier país estés donde estés.`
  String get textFlow1_2 {
    return Intl.message(
      'Envía recargas al celular de cualquier país estés donde estés.',
      name: 'textFlow1_2',
      desc: '',
      args: [],
    );
  }

  /// `Fácil y rápido`
  String get textFlow2_1 {
    return Intl.message(
      'Fácil y rápido',
      name: 'textFlow2_1',
      desc: '',
      args: [],
    );
  }

  /// `Recarga los celulares de tu familia en 3 simples pasos.`
  String get textFlow2_2 {
    return Intl.message(
      'Recarga los celulares de tu familia en 3 simples pasos.',
      name: 'textFlow2_2',
      desc: '',
      args: [],
    );
  }

  /// `Seguro y confiable`
  String get textFlow3_1 {
    return Intl.message(
      'Seguro y confiable',
      name: 'textFlow3_1',
      desc: '',
      args: [],
    );
  }

  /// `Los pagos se realizan a través de un entorno protegido y seguro.`
  String get textFlow3_2 {
    return Intl.message(
      'Los pagos se realizan a través de un entorno protegido y seguro.',
      name: 'textFlow3_2',
      desc: '',
      args: [],
    );
  }

  /// `¿A quién le vas a enviar la recarga?`
  String get textFlow4_1 {
    return Intl.message(
      '¿A quién le vas a enviar la recarga?',
      name: 'textFlow4_1',
      desc: '',
      args: [],
    );
  }

  /// `Introduce tu número de teléfono`
  String get textPhone {
    return Intl.message(
      'Introduce tu número de teléfono',
      name: 'textPhone',
      desc: '',
      args: [],
    );
  }

  /// `Centro de ayuda`
  String get textHelpTitle {
    return Intl.message(
      'Centro de ayuda',
      name: 'textHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Registrate para hacer recargas más rápido`
  String get textRegisterTitle {
    return Intl.message(
      'Registrate para hacer recargas más rápido',
      name: 'textRegisterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona el país del celular`
  String get textCountryPhone {
    return Intl.message(
      'Selecciona el país del celular',
      name: 'textCountryPhone',
      desc: '',
      args: [],
    );
  }

  /// `Celular de la recarga`
  String get textPhoneRecharge {
    return Intl.message(
      'Celular de la recarga',
      name: 'textPhoneRecharge',
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

  /// `Por favor rellena el formulario.`
  String get formTitle {
    return Intl.message(
      'Por favor rellena el formulario.',
      name: 'formTitle',
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

  /// `Enviar`
  String get formSend {
    return Intl.message(
      'Enviar',
      name: 'formSend',
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

  /// `Formulario de contacto`
  String get formHelp {
    return Intl.message(
      'Formulario de contacto',
      name: 'formHelp',
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

  /// `Adjuntar archivo`
  String get formAttach {
    return Intl.message(
      'Adjuntar archivo',
      name: 'formAttach',
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

  /// `Tú número de celular`
  String get loginHint {
    return Intl.message(
      'Tú número de celular',
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

  /// `Recargas recientes`
  String get recentRecharges {
    return Intl.message(
      'Recargas recientes',
      name: 'recentRecharges',
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
