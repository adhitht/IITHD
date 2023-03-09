import 'package:flutter/material.dart';
import 'package:iithd2/widgets/feed_item.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iithd2/services/params.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          leading: const Text(""),
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(11),
                child: const Text("Feed",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          pinned: true,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      body: const FeedPagecont(),
    );
  }
}

class FeedPagecont extends StatefulWidget {
  const FeedPagecont({super.key});

  @override
  State<FeedPagecont> createState() => _FeedPagecontState();
}

class _FeedPagecontState extends State<FeedPagecont> {

  final String url = '$host/test/feed';
  List feed = [];

  Future<List> getFeedList() async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      feed = json.decode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return feed;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFeedList(),
      builder: (context, snapshot) => snapshot.hasData
          ? RefreshIndicator(
              onRefresh: getFeedList,
              child: ListView.builder(
                  // render the list
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return snapshot.data![index]['button'].isNotEmpty
                        ? FeedItem(
                            title: snapshot.data![index]['title'],
                            organiser: snapshot.data![index]['organiser'],
                            date: snapshot.data![index]['date'],
                            description: snapshot.data![index]['description'],
                            mddescription: snapshot.data![index]
                                ['mddescription'],
                            button: snapshot.data![index]['button'].keys
                                .toList()[0],
                            url: snapshot.data![index]['button'].values
                                .toList()[0],
                          )
                        : FeedItem(
                            title: snapshot.data![index]['title'],
                            organiser: snapshot.data![index]['organiser'],
                            date: snapshot.data![index]['date'],
                            description: snapshot.data![index]['description'],
                            mddescription: snapshot.data![index]
                                ['mddescription'],
                          );
                  }),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
