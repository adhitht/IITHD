import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:iithd2/services/params.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    super.key,
    required this.title,
    required this.organiser,
    required this.date,
    required this.description,
    required this.mddescription,
    this.button = '',
    this.url = 'https://google.com',
  });

  final String title;
  final String organiser;
  final String date;
  final String description;
  final String mddescription;
  final String button;
  final String url;

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Widget customButton() {
    // Widget button =
    switch (button.substring(0, 2)) {
      case "WA":
        {
          return OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: wacolor),
            onPressed: () => _launchURL(url),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(scale: 18, 'assets/logos/whatsapp.png'),
              const SizedBox(width: 5),
              Text(button.substring(2))
            ]),
          );
        }
      case "GS":
        {
          return OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF7F3BB8)),
            onPressed: () => _launchURL(url),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(scale: 22, 'assets/logos/google_form.png'),
              const SizedBox(width: 5),
              Text(button.substring(2))
            ]),
          );
        }
      default:
        {
          return OutlinedButton(
            onPressed: () => _launchURL(url),
            child: Text(button),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 125, 10, 125),
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 3, 3, 10),
                      child: Text(
                        "$organiser  |  $date",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(children: [
                        // Displaying Description in markdown. MarkdownBody class is from flutter_markdown
                        MarkdownBody(selectable: true, data: description),
                      ]),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                "$organiser  |  $date",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              child: button.isNotEmpty ? customButton()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
