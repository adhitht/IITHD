import 'package:flutter/material.dart';

const List sideNavbarItems = [
  // [Name of Item, Icon, pageIndex in HomePage],
  ["Home", Icons.home_outlined, 0],
  ["Calendar", Icons.calendar_today_outlined, 1],
  ["Mess Menu", Icons.restaurant_menu, 4],
  ["Cab Sharing", Icons.local_taxi_outlined, 5],
  ["Feed", Icons.forum_outlined, 2],
  ["Settings", Icons.settings_sharp, 6],
];

List<Widget> sideNavbarWidget(context, setIndex) {
  List<Widget> items = [];
  items = List.generate(
    sideNavbarItems.length,
    (index) => ListTile(
      leading: Icon(sideNavbarItems[index][1], color: Colors.black),
      title: Text(
        sideNavbarItems[index][0],
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
      ),
      onTap: () {
        Navigator.pop(context);
        setIndex(sideNavbarItems[index][2]);
      },
    ),
  );

  // Inserting Header to Top of Side Navigation Bar
  items.insert(
    0,
    const DrawerHeader(
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.white),
        accountName: Text(
          "Adhith T",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        accountEmail: Text(
          "MA22BTECH11003",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        currentAccountPictureSize: Size.square(50),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Color.fromARGB(176, 255, 230, 89),
          child: Text(
            "A",
            style: TextStyle(
                fontSize: 30.0, color: Color.fromARGB(255, 255, 141, 141)),
          ),
        ),
      ),
    ),
  );
  return items;
}

class SideNavbar extends StatelessWidget {
  const SideNavbar({super.key, required this.setIndex});

  final Function setIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: sideNavbarWidget(context, setIndex),
      ),
    );
  }
}
