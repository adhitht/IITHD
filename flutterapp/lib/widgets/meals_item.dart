import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iithd2/services/params.dart';

class MealsItem extends StatefulWidget {
  const MealsItem({
    super.key,
    required this.meal,
    required this.time,
    required this.meals,
  });

  final String meal;
  final String time;
  final List meals;

  @override
  State<MealsItem> createState() => _MealsItemState();
}

class _MealsItemState extends State<MealsItem> {
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isShown
            ? Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(60), bottom: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            widget.meals.length,
                            (index) => Container(
                                padding: const EdgeInsets.fromLTRB(30, 3, 3, 3),
                                child: Text(
                                  widget.meals[index],
                                  style: const TextStyle(fontSize: 20),
                                )))),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        InkWell(
          onTap: () {
            setState(() {
              isShown = !isShown;
            });
          },
          child: Container(
              height: 62,
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Container(
                height: 62,
                padding: const EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 0, 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.meal,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Text(
                                  widget.time,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      // color: Color(0xFF4D4D4D),
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.75),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: isShown
                              ? const Icon(
                                  Icons.arrow_drop_up_rounded,
                                  color: Color(0xFF696969),
                                  size: 35,
                                )
                              : const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Color(0xFF696969),
                                  size: 35,
                                )),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

// Container for Home Page
class HomeMealCont extends StatefulWidget {
  const HomeMealCont({super.key});

  @override
  State<HomeMealCont> createState() => _HomeMealContState();
}

class _HomeMealContState extends State<HomeMealCont> {
  Map meals = {};

  Future<Map> getMeals() async {
    const String url = messUrl;
    http.Response response = await http.get(Uri.parse(url));
    meals = jsonDecode(response.body);
    return meals['LDH'][weekday];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMeals(),
        builder: (context, snapshot) => snapshot.hasData
            ?
            hour < 10
                ? MealsItem(
                    meal: "Breakfast",
                    time: "7:30AM - 9:30AM",
                    meals: snapshot.data!["Breakfast"])
                : hour < 16
                    ? MealsItem(
                        meal: "Lunch",
                        time: "12:00PM - 2:30PM",
                        meals: snapshot.data!["Lunch"])
                    : hour < 19
                        ? MealsItem(
                            meal: "Snacks",
                            time: "5:00PM - 6:30PM",
                            meals: snapshot.data!["Snacks"])
                        : MealsItem(
                            meal: "Dinner",
                            time: "8:00PM - 10:30PM",
                            meals: snapshot.data!["Dinner"])
            : const SizedBox.shrink());
  }
}

// Column for Mess Page
class MessPageCont extends StatefulWidget {
  const MessPageCont({super.key});

  @override
  State<MessPageCont> createState() => _MessPageContState();
}

class _MessPageContState extends State<MessPageCont> {
  Map meals = {};

  Future<Map> getMeals() async {
    const String url = messUrl;
    http.Response response = await http.get(Uri.parse(url));
    meals = jsonDecode(response.body);
    return meals['LDH'][weekday];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMeals(),
      builder: (context, snapshot) => snapshot.hasData
          ? Column(
              children: List.generate(
                  snapshot.data!.keys.length,
                  (index) => MealsItem(
                      meal: snapshot.data!.keys.toList()[index],
                      time: mealTimings[snapshot.data!.keys.toList()[index]],
                      meals:
                          snapshot.data![snapshot.data!.keys.toList()[index]])),
            )
          : const CircularProgressIndicator(),
    );
  }
}
