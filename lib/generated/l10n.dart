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

  /// `Recarga el celular de tus seres queridos de manera rápida, segura y sencilla.`
  String get homeMainText {
    return Intl.message(
      'Recarga el celular de tus seres queridos de manera rápida, segura y sencilla.',
      name: 'homeMainText',
      desc: '',
      args: [],
    );
  }

  /// `comenzar`
  String get btnComenzar {
    return Intl.message(
      'comenzar',
      name: 'btnComenzar',
      desc: '',
      args: [],
    );
  }

  /// `ingresar`
  String get btnIngresar {
    return Intl.message(
      'ingresar',
      name: 'btnIngresar',
      desc: '',
      args: [],
    );
  }

  /// `ayuda`
  String get ayuda {
    return Intl.message(
      'ayuda',
      name: 'ayuda',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get idioma {
    return Intl.message(
      'Idioma',
      name: 'idioma',
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

  /// `Registrarme`
  String get btnRegister {
    return Intl.message(
      'Registrarme',
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

  /// `Haz recargas a los celulares de tus familiares en 3 simples pasos.`
  String get flow2_2 {
    return Intl.message(
      'Haz recargas a los celulares de tus familiares en 3 simples pasos.',
      name: 'flow2_2',
      desc: '',
      args: [],
    );
  }

  /// `Seguro y fiable`
  String get flow3_1 {
    return Intl.message(
      'Seguro y fiable',
      name: 'flow3_1',
      desc: '',
      args: [],
    );
  }

  /// `Los pagos se hacen a través de un entorno protegido y seguro.`
  String get flow3_2 {
    return Intl.message(
      'Los pagos se hacen a través de un entorno protegido y seguro.',
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

  /// `Celular de la recarga`
  String get btnCel {
    return Intl.message(
      'Celular de la recarga',
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

  /// `Comenzar recarga`
  String get btnTopUpC {
    return Intl.message(
      'Comenzar recarga',
      name: 'btnTopUpC',
      desc: '',
      args: [],
    );
  }

  /// `País del celular`
  String get pais {
    return Intl.message(
      'País del celular',
      name: 'pais',
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

  /// `Centro de Ayuda`
  String get ayudaTitle {
    return Intl.message(
      'Centro de Ayuda',
      name: 'ayudaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Formulario de contacto`
  String get formAyuda {
    return Intl.message(
      'Formulario de contacto',
      name: 'formAyuda',
      desc: '',
      args: [],
    );
  }

  /// `¿Necesitas más ayuda?`
  String get masAyuda {
    return Intl.message(
      '¿Necesitas más ayuda?',
      name: 'masAyuda',
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

  /// `Por favor, completa el formulario.`
  String get fromTitle {
    return Intl.message(
      'Por favor, completa el formulario.',
      name: 'fromTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get formNombre {
    return Intl.message(
      'Nombre',
      name: 'formNombre',
      desc: '',
      args: [],
    );
  }

  /// `Introduce tu nombre`
  String get formNombrePlaceholder {
    return Intl.message(
      'Introduce tu nombre',
      name: 'formNombrePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu nombre`
  String get formNombreError {
    return Intl.message(
      'Por favor, escribe tu nombre',
      name: 'formNombreError',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get formEmail {
    return Intl.message(
      'E-mail',
      name: 'formEmail',
      desc: '',
      args: [],
    );
  }

  /// `Introduce tu correo`
  String get formEmailPlaceholder {
    return Intl.message(
      'Introduce tu correo',
      name: 'formEmailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu correo`
  String get formEmailError {
    return Intl.message(
      'Por favor, escribe tu correo',
      name: 'formEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Mensaje`
  String get formMensaje {
    return Intl.message(
      'Mensaje',
      name: 'formMensaje',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu mensaje`
  String get formMensajePlaceholder {
    return Intl.message(
      'Escribe tu mensaje',
      name: 'formMensajePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu mensaje`
  String get formMensajeError {
    return Intl.message(
      'Por favor, escribe tu mensaje',
      name: 'formMensajeError',
      desc: '',
      args: [],
    );
  }

  /// `Adjuntar archivos`
  String get formAdjuntar {
    return Intl.message(
      'Adjuntar archivos',
      name: 'formAdjuntar',
      desc: '',
      args: [],
    );
  }

  /// `Enviar mensaje`
  String get formEnviar {
    return Intl.message(
      'Enviar mensaje',
      name: 'formEnviar',
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

  /// `Te contactaremos a través de correo electrónico lo antes posible.`
  String get successLead {
    return Intl.message(
      'Te contactaremos a través de correo electrónico lo antes posible.',
      name: 'successLead',
      desc: '',
      args: [],
    );
  }

  /// `Volver a Inicio`
  String get successButton {
    return Intl.message(
      'Volver a Inicio',
      name: 'successButton',
      desc: '',
      args: [],
    );
  }

  /// `Indica tu número de celular para iniciar sesión`
  String get loginTitle {
    return Intl.message(
      'Indica tu número de celular para iniciar sesión',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Número de celular`
  String get loginPlaceholder {
    return Intl.message(
      'Número de celular',
      name: 'loginPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Tu nº de celular`
  String get loginHint {
    return Intl.message(
      'Tu nº de celular',
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

  /// `Recupera tu contraseña`
  String get titlePass {
    return Intl.message(
      'Recupera tu contraseña',
      name: 'titlePass',
      desc: '',
      args: [],
    );
  }

  /// `¡Hola, {name}!`
  String hello(Object name) {
    return Intl.message(
      '¡Hola, $name!',
      name: 'hello',
      desc: '',
      args: [name],
    );
  }

  /// `Guardar`
  String get guardar {
    return Intl.message(
      'Guardar',
      name: 'guardar',
      desc: '',
      args: [],
    );
  }

  /// `Mis contactos`
  String get contactos {
    return Intl.message(
      'Mis contactos',
      name: 'contactos',
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

  /// `Recargas Recientes`
  String get recargasRecientes {
    return Intl.message(
      'Recargas Recientes',
      name: 'recargasRecientes',
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
  String get notificaciones {
    return Intl.message(
      'Notificaciones',
      name: 'notificaciones',
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
