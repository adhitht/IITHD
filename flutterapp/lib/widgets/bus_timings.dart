import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iithd2/services/params.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeBusCont extends StatefulWidget {
  const HomeBusCont({super.key});

  @override
  State<HomeBusCont> createState() => _HomeBusContState();
}

class _HomeBusContState extends State<HomeBusCont> {
  final List bustimings = [];
  Map bus = {};
  DateTime now = DateTime.now();
  int hour = int.parse(DateFormat('H').format(DateTime.now()));
  int minute = int.parse(DateFormat('m').format(DateTime.now()));
  String minutes = DateFormat('m').format(DateTime.now());
  int totalMinutes = int.parse(DateFormat('H').format(DateTime.now())) * 60 +
      int.parse(DateFormat('m').format(DateTime.now()));

  Future<List> getBusTimings() async {
    const String url = '$host/bus';
    http.Response response = await http.get(Uri.parse(url));
    bus = json.decode(response.body);
    for (String startPoints in bus.keys) {
      for (String endPoints in bus[startPoints].keys) {
        for (String time in bus[startPoints][endPoints]) {
          int totMin = int.parse(time.substring(0, 2)) * 60 +
              int.parse(time.substring(3));
          int timeDiff = totMin - totalMinutes;
          String timeDiffStr = '';
          if (timeDiff > 0) {
            if (timeDiff > 60) {
              timeDiffStr =
                  (timeDiff ~/ 60) > 1 ? "${timeDiff ~/ 60} Hours" : "1 Hour";
            } else {
              timeDiffStr = timeDiff > 1 ? "$timeDiff Minutes" : "1 Minute";
            }
            bustimings.add([startPoints, endPoints, timeDiffStr]);
            break;
          }
        }
      }
    }
    return bustimings;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBusTimings(),
        builder: ((context, snapshot) => snapshot.hasData
            ? CarouselSlider(
                items: List.generate(
                  snapshot.data!.length,
                  (index) => TimingCard(
                      startPoint: snapshot.data![index][0],
                      endPoint: snapshot.data![index][1],
                      time: snapshot.data![index][2]),
                ),
                options: CarouselOptions(
                  height: 175.0,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.8,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}

class TimingCard extends StatelessWidget {
  const TimingCard({
    super.key,
    required this.startPoint,
    required this.endPoint,
    required this.time,
  });

  final String startPoint;
  final String endPoint;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.75, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5.0, 5.0),
            blurRadius: 1,
            spreadRadius: 0.01,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.directions_bus_outlined,
            color: Colors.black,
            size: 34,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(startPoint,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black,
                ),
                Text(endPoint,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Text("In Next",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 116, 116, 116))),
          Text(time,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
