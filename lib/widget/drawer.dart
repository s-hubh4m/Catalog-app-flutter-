// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://imgs.search.brave.com/br2itHng4YFcb2KrgPAMll1lfWPdf4wndFKugCFSKGM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZs/YXRpY29uLmNvbS8x/MjgvMzU0LzM1NDY4/NC5wbmc";
    return Drawer(
      shadowColor:Color.fromARGB(255, 156, 109, 237), 
      backgroundColor: Color.fromARGB(255, 35, 35, 35),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 37, 37)
              ),
              accountName: Text("Shubham Lakhan",
              style: TextStyle(
                color: Color.fromARGB(255, 156, 109, 237),
                fontWeight: FontWeight.bold
              ),),
              accountEmail: Text("shubhamlakhan4508@gmail.com",
              style: TextStyle(
                color: Color.fromARGB(255, 156, 109, 237),
                fontWeight: FontWeight.bold
              ),),
              currentAccountPicture: Image.network(imageUrl),
              
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Color.fromARGB(255, 156, 109, 237),
            ),
            title: Text("Home",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 109, 237),
              fontSize: 20,

            ),),

          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Color.fromARGB(255, 156, 109, 237),
            ),
            title: Text("Profile",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 109, 237),
              fontSize: 20,

            ),),

          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.book_circle,
              color: Color.fromARGB(255, 156, 109, 237),
            ),
            title: Text("Subjects",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 109, 237),
              fontSize: 20,

            ),),

          ),
        ],
      ),
    );
  }
}