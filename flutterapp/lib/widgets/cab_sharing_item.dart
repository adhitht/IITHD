import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iithd2/services/params.dart';

class CabSharingCard extends StatelessWidget {
  const CabSharingCard({
    super.key,
    required this.startPoint,
    required this.endPoint,
    required this.date,
    required this.time,
    required this.name,
    this.additionalinfo = '',
    required this.phone,
  });

  final String startPoint, endPoint, date, time, name, additionalinfo, phone;

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    debugPrint("Trying to launch");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    debugPrint("Launched");
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("$startPoint ➞",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text(endPoint,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text("$date $time",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text(name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
          additionalinfo.isNotEmpty
              ? Text("     $additionalinfo",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500))
              : const SizedBox.shrink(),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: callColor),
                onPressed: () => _launchURL("tel:+918714081616"),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Image.asset(scale: 6, 'assets/logos/call.png'),
                  const SizedBox(width: 5),
                  const Text("Call"),
                ]),
              ),
              const Text("   "),
              OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: wacolor),
                onPressed: () => _launchURL(
                    "https://api.whatsapp.com/send?phone=$phone&text=Interested in Cab Sharing from _${startPoint}_ to _${endPoint}_ on *$date*"),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Image.asset(scale: 17, 'assets/logos/whatsapp.png'),
                  const SizedBox(width: 5),
                  const Text("Chat"),
                ]),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class CabSharingCont extends StatefulWidget {
  const CabSharingCont({super.key});

  @override
  State<CabSharingCont> createState() => _CabSharingContState();
}

class _CabSharingContState extends State<CabSharingCont> {
  List cab = [];

  Future<List> getCabSharingList() async {
    const String url = '$host/test/cab';
    http.Response response = await http.get(Uri.parse(url));
    cab = json.decode(response.body);
    return cab;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCabSharingList(),
      builder: (context, snapshot) => snapshot.hasData
          ? RefreshIndicator(
              onRefresh: getCabSharingList,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CabSharingCard(
                      startPoint: snapshot.data![index]["startPoint"],
                      endPoint: snapshot.data![index]["endPoint"],
                      date: snapshot.data![index]["date"],
                      time: snapshot.data![index]["time"],
                      name: snapshot.data![index]["name"],
                      additionalinfo: snapshot.data![index]["additionalinfo"],
                      phone: snapshot.data![index]["phone"])),
            )
          : const SizedBox.shrink(),
    );
  }
}
