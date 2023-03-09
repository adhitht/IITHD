import 'package:flutter/material.dart';
import 'package:iithd2/services/color_convertor.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.time,
    required this.eventhead,
    required this.eventtitle,
    required this.eventcolor,
  });

  final String time;
  final String eventhead;
  final String eventtitle;
  final String eventcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 62,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black),
          borderRadius: BorderRadius.circular(80),
        ),
        //Time in CalendarItem
        child: Row(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: ColorConvert(eventcolor),
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(80)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    time,
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.75),
                  ),
                ),
              ),
            ),
            //Details in CalendarItem
            Container(
              height: 62,
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      eventhead,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Text(
                        eventtitle,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.75),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
