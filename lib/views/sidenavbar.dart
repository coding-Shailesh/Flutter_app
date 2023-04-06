import 'package:flutter/material.dart';
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(color: Colors.black),
              accountName: Text('news',style: TextStyle(color: Colors.white),),
              accountEmail: Text('News.gmail',style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?b=1&s=170667a&w=0&k=20&c=YQ_j83pg9fB-HWOd1Qur3_kBmG_ot_hZty8pvoFkr6A='),)
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('favorites'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('friends'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
