import 'package:alumni_sandbox/back_end/currentUser.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              CurrentUser.full_name,
              style: TextStyle(),
            ),
            accountEmail: Text(CurrentUser.university),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  CurrentUser.image_path,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),

          //<a href="https://www.freepik.com/free-vector/college-building-educational-institution-banner_5581911.htm#query=university&position=33&from_view=keyword">Image by vectorpocket</a> on Freepik
          /* decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/3616.jpg")),
            ),
          ),*/
          Divider(),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Perks & Benefits '),
            onTap: () => Navigator.pushNamed(context, "/perks"),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('List of Courses'),
            onTap: () => Navigator.pushNamed(context, "/courses"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
            onTap: () => Navigator.pushNamed(context, "/yourprofile"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('About'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
