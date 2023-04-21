import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("LABABZ"),
            accountEmail: Text("lababz@danslesdix.vroom"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://wallpapers.com/images/featured/ahvtptya3jvtmkbt.jpg")),
          ),
          ListTile(
            leading: Icon(Icons.car_crash),
            title: Text("LABABZ"),
            subtitle: Text("17 May 2023"),
          ),
          ListTile(
            leading: Icon(Icons.car_rental),
            title: Text("LAWALK'Z"),
            subtitle: Text("17 May 2023"),
          )
        ],
      ),
    );
  }
}
