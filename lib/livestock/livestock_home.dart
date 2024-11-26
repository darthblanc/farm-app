import 'package:farm_app/livestock/livestock_type.dart';
import 'package:flutter/material.dart';

class LivestockHome extends StatelessWidget {
  LivestockHome({super.key});

  @override
  Widget build(context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      width: MediaQuery.sizeOf(context).width / 2,
      child: Card(
        color: Colors.black,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LivestockType()));
          },
          heroTag: "LivestockHome",
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Image.asset(
                "assets/images/cow.jpg",
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                alignment: Alignment.topCenter,
              ),
              Text(
                "Livestock",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
