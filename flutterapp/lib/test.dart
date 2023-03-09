// This is a page to test out new Widgets
import 'package:flutter/material.dart';
import 'package:iithd2/widgets/feed_item.dart';
import 'package:iithd2/widgets/bus_timings.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BusTimings extends StatelessWidget {
  const BusTimings({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        TimingCard(
            startPoint: "Hostel Circle",
            endPoint: "Main Gate",
            time: "15 Minutes"),
        TimingCard(
            startPoint: "Main Gate",
            endPoint: "Lingampally",
            time: "25 Minutes"),
        TimingCard(
            startPoint: "New Hostel", endPoint: "Mess", time: "10 Minutes"),
      ],
      options: CarouselOptions(
        height: 175.0,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.8,
      ),
    );
  }
}

class FeedPage2 extends StatelessWidget {
  const FeedPage2({super.key});

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
      body: ListView(
        children: const [
          FeedItem(
            title: "Institute Valorant League",
            organiser: "Glitch",
            date: "26 January 2022",
            description:
                "Glitch is very excited to announce the very first edition of the Institute Valorant League. It will be franchised...",
            mddescription:
                "Glitch is very excited to announce the very first edition of the Institute Valorant League. It will be franchised...",
          ),
          FeedItem(
            title: "Availability of bicycle repairer near Hostel H block",
            organiser: "Green Office",
            date: "26 January 2022",
            description:
                "         Bicycles repairer will be available near hostel H block from 10.30 AM to 4.00PM.",
            mddescription:
                "         Bicycles repairer will be available near hostel H block from 10.30 AM to 4.00PM.",
            button: "GSRegister",
          ),
          FeedItem(
            title: "KirIITH, Issue-13",
            organiser: "Director",
            date: "26 January 2022",
            description:
                "As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized.As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized..",
            mddescription:
                "As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized.As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarizedAs you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized..",
            button: "WAChat",
          ),
          FeedItem(
            title: "Night Sky Observation Session !!",
            organiser: "Cepheid",
            date: "26 January 2022",
            description:
                "       Hello everyone!! \nWe are back again with the night sky observation session. Join us on Sunday for enjoying the magnificent views of the...",
            mddescription:
                "       Hello everyone!! \nWe are back again with the night sky observation session. Join us on Sunday for enjoying the magnificent views of the...",
            button: "Register",
          ),
          FeedItem(
            title: "Recreational room registration form",
            organiser: "Director",
            date: "26 January 2022",
            description:
                "As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized...",
            mddescription:
                "As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized...",
            button: "Register",
          ),
        ],
      ),
    );
  }
}

class BlueSelectionButton extends StatelessWidget {
  const BlueSelectionButton(
      {super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title,
          style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.w700)),
    );
  }
}
