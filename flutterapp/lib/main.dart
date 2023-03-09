import 'package:flutter/material.dart';
import 'package:iithd2/services/params.dart';
import 'package:iithd2/widgets/side_nav_bar.dart';
import 'package:iithd2/canvas_paint/hamburger.dart';
import 'package:iithd2/pages/homepage.dart';
import 'package:iithd2/pages/feedpage.dart';
import 'package:iithd2/pages/messpage.dart';
import 'package:iithd2/pages/idcardpage.dart';
import 'package:iithd2/pages/cabsharingpage.dart';
import 'package:iithd2/pages/calendarpage.dart';
import 'package:iithd2/pages/settingspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IITH Dashboard',
      theme: themedata,
      home: const AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int navIndex = 0;
  int pageIndex = 0;

  void setIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  final pages = const [
    HomePage(),
    CalendarPage(),
    FeedPage(),
    IdPage(),
    MessPage(),
    CabPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: const Color.fromARGB(1, 255, 255, 255),
        backgroundColor: const Color(0xFF3C393E),
        // Hamburger on App Bar
        // Hamburger made with CustomPainter
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CustomPaint(
                  painter: HamburgerPainter(),
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      // setIndex for setting pageIndex
      drawer: SideNavbar(setIndex: (int index) {
        setIndex(index);
      }),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Items in Bottom Navigation
          pageIndex == 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setIndex(0);
                    },
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setIndex(0);
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
          pageIndex == 1
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setIndex(1);
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setIndex(1);
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
          pageIndex == 2
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setIndex(2);
                    },
                    icon: const Icon(
                      Icons.forum_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setIndex(2);
                  },
                  icon: const Icon(
                    Icons.forum_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
          pageIndex == 3
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setIndex(3);
                    },
                    icon: const Icon(
                      Icons.badge_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                )
              : IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setIndex(3);
                    },
                    icon: const Icon(
                      Icons.badge_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
        ],
      ),
    );
  }
}
