import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Auth/Auth.dart';
import 'package:travel_destinatio_listing_app/Components/myDrawerTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _authService = Auth();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue.shade100,
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child:
                  Icon(Icons.landscape_rounded, size: 100, color: Colors.blue),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Colors.blue.shade300,
                thickness: 2,
              ),
            ),

            //Home Tile
            MyDrawerTile(
                text: 'HOME',
                icon: Icons.home,
                onTap: () => Navigator.pop(context)),

            Spacer(),
            //Log Out Tile
            MyDrawerTile(
                text: 'LOG OUT',
                icon: Icons.logout_outlined,
                onTap: () {
                  logout();
                }),

            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
