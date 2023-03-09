import 'package:flutter/material.dart';
import 'package:iithd2/widgets/meals_item.dart';

class MessPage extends StatelessWidget {
	const MessPage({super.key});
	
	@override
	Widget build(BuildContext context){
	return ListView(
		children: const [
			SizedBox(
				height: 82,
				child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Bus",style:TextStyle(fontFamily: 'Inter',fontSize:24,fontWeight: FontWeight.w600)),
                ),
			),
      Expanded(child: MessPageCont()),
		],);
	}
}