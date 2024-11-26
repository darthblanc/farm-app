import 'package:farm_app/shipment/shipment_service.dart';
import 'package:farm_app/shipment/shipment.dart';
import 'package:flutter/material.dart';

class ShipmentType extends StatefulWidget {
  ShipmentType({super.key});

  @override
  State<ShipmentType> createState() => _ShipmentTypeState();
}

class _ShipmentTypeState extends State<ShipmentType> {
  List<Shipment> shipmentList = [];
  final service = ShipmentService();

  @override
  initState() {
    super.initState();
    service.fetchList().then((fetchedList) {
      setState(() {
        shipmentList = fetchedList.data;
      });
    });
  }

  void _show() {
    final fromController = TextEditingController();
    final toController = TextEditingController();
    final typeController = TextEditingController();
    final dateInController = TextEditingController();
    final dateOutController = TextEditingController();
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: fromController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'from'),
            ),
            TextField(
              controller: toController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'to'),
            ),
            TextField(
              controller: typeController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'type'),
            ),
            TextField(
              controller: dateInController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'date in'),
            ),
            TextField(
              controller: dateOutController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'date out'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  final newShipment = Shipment(
                      from: fromController.text,
                      to: toController.text,
                      type: typeController.text,
                      dateIn: dateInController.text,
                      dateOut: dateOutController.text);
                  service.insertReview(
                      newShipment.from,
                      newShipment.to,
                      newShipment.type,
                      newShipment.dateIn,
                      newShipment.dateOut);
                  setState(() {
                    shipmentList.add(newShipment);
                  });
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipments"),
      ),
      body: ListView.builder(
          itemCount: shipmentList.length,
          itemBuilder: (context, index) {
            Shipment shipment = shipmentList[index];
            return Card(
              child: Text(
                  "From:${shipment.from} | To:${shipment.to} | Type:${shipment.type} | Start:${shipment.dateIn} | End:${shipment.dateOut}"),
            );
          }),
      bottomSheet: FloatingActionButton(
        onPressed: _show,
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }
}
