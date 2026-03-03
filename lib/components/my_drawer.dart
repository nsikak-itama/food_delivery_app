import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async{
    final _authService = AuthService();
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded, 
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          MyDrawerTile(text: "Home", icon: Icons.home, onTap: () => Navigator.pop(context),),
          MyDrawerTile(
            text: "Settings", 
            icon: Icons.settings, 
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: MyDrawerTile(
              text: "Log out", 
              icon: Icons.logout, 
              onTap: logout
            ),
          )
        ],
      ),
    );
  }
}