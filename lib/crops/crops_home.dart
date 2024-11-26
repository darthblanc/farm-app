import 'package:farm_app/crops/crop_type.dart';
import 'package:flutter/material.dart';

class CropsHome extends StatelessWidget {
  CropsHome({super.key});

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
                .push(MaterialPageRoute(builder: (context) => CropType()));
          },
          heroTag: "CropsHome",
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Image.asset(
                "assets/images/crops.jpg",
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                alignment: Alignment.topCenter,
              ),
              Text(
                "Crops",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
