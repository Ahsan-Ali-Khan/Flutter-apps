import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/models/User.dart';

class UserDrawer extends StatelessWidget {
  User user;
  UserDrawer(this.user);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent
            ),
            currentAccountPicture: Image.network(user.image),
              accountName: Text(user.name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
              accountEmail: Text(user.email,style: TextStyle(color: Colors.deepPurple),))
        ],
      ),
    );
  }
}
