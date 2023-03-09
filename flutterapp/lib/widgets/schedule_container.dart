import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:iithd2/widgets/calendar_item.dart';
import 'package:iithd2/services/params.dart';

class Schedulecont extends StatefulWidget {
  const Schedulecont({super.key});

  @override
  SchedulecontState createState() => SchedulecontState();
}

class SchedulecontState extends State<Schedulecont> {
  final url = '$host/test/events';
  List schedulelist = [];

  Future<List> _loadData() async {
    List events = [];
    try {
      final http.Response response = await http.get(Uri.parse(url));
      events = json.decode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) => snapshot.hasData
                ? Column(
                    children: List.generate(
                        snapshot.data!.length,
                        (index) => CalendarItem(
                            time: snapshot.data![index]['time'],
                            eventhead: snapshot.data![index]['shortname'],
                            eventtitle: snapshot.data![index]['title'],
                            eventcolor: snapshot.data![index]['color'])),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))
      ],
    );
  }
}
