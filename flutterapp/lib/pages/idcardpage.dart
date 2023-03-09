import 'package:flutter/material.dart';

class IdPage extends StatelessWidget {
  const IdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
         Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("ID Card",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
        ),
        IdCard(
          name: "Adhith T",
          branch: "Mathematics and Computing",
          type: "Btech Student",
          phone: "8714081616",
          id: "MA22BTECH11003",
        ),
      ],
    );

    // return Column(
    //   children: [
    //     const Padding(
    //       padding: EdgeInsets.all(20.0),
    //       child: Text("Mess",
    //           style: TextStyle(
    //               fontFamily: 'Inter',
    //               fontSize: 24,
    //               fontWeight: FontWeight.w600)),
    //     ),
    //     Container(
    //       height: double.infinity,
    //       child: ListView(
    //         children: const [
    //           SizedBox(
    //             height: 82,
    //             child: Text("Hello"),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}

class IdCard extends StatelessWidget {
  const IdCard(
      {super.key,
      required this.name,
      required this.branch,
      required this.type,
      required this.phone,
      required this.id});

  final String name;
  final String branch;
  final String type;
  final String phone;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 25, 30, 25),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FF97),
        // border: Border.all(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF9737),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Image.asset(
                      scale: 1.75,
                      "assets/images/logo.png",
                    ),
                  ),
                  const Text(
                    "IIT Hyderabad",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
              )),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(scale: 2, "assets/images/avatar.jpeg"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Text(
                  "BTech Student",
                  style: TextStyle(
                      color: Color(0xFF6D6C6C),
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(branch,
                    style: const TextStyle(
                        color: Color(0xFF6D6C6C),
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text("Ph: $phone",
                    style: const TextStyle(
                        color: Color(0xFF6D6C6C),
                        fontFamily: 'Inter',
                        fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                  child: Text(id, style: const TextStyle(fontFamily: 'Inter', fontSize: 20)),
                ),
                Text(id,
                    style: const TextStyle(fontFamily: 'Barcode', fontSize: 48)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
