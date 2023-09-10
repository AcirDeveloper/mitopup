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
    title: 'Edit Information',
    subtitle: '',
    link: '/profile/edit_info',
  ),
  MenuProfile(
    title: 'Change PIN',
    subtitle: '',
    link: '/profile/change_pin',
  ),
  MenuProfile(
    title: 'Friends invitation',
    subtitle: '',
    link: '/profile/invite_friends',
  ),
  MenuProfile(
    title: 'Payment Methods',
    subtitle: '',
    link: '/profile/payment_methods',
  ),
  MenuProfile(
    title: 'Help Center',
    subtitle: '',
    link: '/profile/help_center',
  ),
  MenuProfile(
    title: 'Other Settings',
    subtitle: 'Notifications & Language',
    link: '/profile/accept_notifications',
  ),
];
