// import 'package:farm_app/finance/balance.dart';
import 'package:farm_app/shipment/shipment_queue.dart';
import 'package:flutter/material.dart';

class ShipmentHome extends StatelessWidget {
  ShipmentHome({super.key});

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
                .push(MaterialPageRoute(builder: (context) => ShipmentType()));
          },
          heroTag: "ShipmentHome",
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Image.asset(
                "assets/images/shippingbox.jpg",
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                alignment: Alignment.topCenter,
              ),
              Text(
                "Shipments",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
