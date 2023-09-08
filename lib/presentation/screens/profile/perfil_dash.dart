import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitopup/config/menu/menu_profile.dart';

class PerfilDash extends StatelessWidget {
  const PerfilDash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuProfile.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const _UserProfileInfo();
        } else {
          final menuProfile = appMenuProfile[index - 1];
          return _CustomListTitleProfile(menuProfile: menuProfile);
        }
      },
    );
  }
}

class _UserProfileInfo extends StatelessWidget {
  const _UserProfileInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 60,
          // Todo: Coloca aquí tu imagen
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Correo Electrónico",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Teléfono",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 20,
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

class _CustomListTitleProfile extends StatelessWidget {
  const _CustomListTitleProfile({
    required this.menuProfile,
  });

  final MenuProfile menuProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, size: 24),
          title: Text(menuProfile.title),
          onTap: () {
            context.push(menuProfile.link);
          },
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          height: 20,
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
