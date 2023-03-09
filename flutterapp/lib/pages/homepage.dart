import 'package:flutter/material.dart';
import 'package:iithd2/widgets/greetings.dart';
import 'package:iithd2/widgets/schedule_container.dart';
import 'package:iithd2/widgets/bus_timings.dart';
import 'package:iithd2/widgets/meals_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Greetings(name: 'Adhith'),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
          child: Text(
            "Schedule",
            style: TextStyle(
                fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Schedulecont(),
        ),
        Text(
          "  Bus Timings",
          style: TextStyle(
              fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w600),
        ),
        HomeBusCont(),
        // BusTimings(),
        Text(""),
        Text(
          "  Mess",
          style: TextStyle(
              fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w600),
        ),
        Text(""),
        HomeMealCont(),
      ],
    );
  }
}
