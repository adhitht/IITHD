import 'package:flutter/material.dart';
import 'package:iithd2/widgets/cab_sharing_item.dart';

class CabPage extends StatelessWidget {
  const CabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 65,
          decoration:  const BoxDecoration(
            boxShadow:  [
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
          padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
          child: const Text("Cab Sharing",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
        ),
        const Expanded(child: CabSharingCont()),
      ],
    );
  }
}
