import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  FootballAppBar({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Football',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          // Handle menu button press
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Handle search button press
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Handle notifications button press
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 4.0,
      shadowColor: Colors.grey.withOpacity(0.5),
    );
  }
}
