class MenuProfile {
  final String title;
  final String subtitle;
  final String link;

  const MenuProfile({
    required this.title,
    required this.subtitle,
    required this.link,
  });
}

const appMenuProfile = <MenuProfile>[
  MenuProfile(
    title: 'Editar información',
    subtitle: 'Editar Información',
    link: '/profile/edit_info',
  ),
  MenuProfile(
    title: 'Cambiar pin de acceso',
    subtitle: 'pin de acceso',
    link: '/profile/change_pin',
  ),
  MenuProfile(
    title: 'Invita a tus amigos',
    subtitle: 'Invita a tus amigos',
    link: '/profile/invite_friends',
  ),
  MenuProfile(
    title: 'Métodos de pago',
    subtitle: 'Métodos de pago',
    link: '/profile/payment_methods',
  ),
  MenuProfile(
    title: 'Centro de ayuda',
    subtitle: 'Centro de ayuda',
    link: '/profile/help_center',
  ),
  MenuProfile(
    title: 'Notificationes',
    subtitle: 'Notificaciones',
    link: '/profile/accept_notifications',
  ),
  MenuProfile(
    title: 'Idioma',
    subtitle: 'Idioma',
    link: '/profile/language',
  ),
];
