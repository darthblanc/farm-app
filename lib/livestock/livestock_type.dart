import 'package:farm_app/livestock/livestock.dart';
import 'package:farm_app/livestock/livestock_service.dart';
import 'package:flutter/material.dart';

class LivestockType extends StatefulWidget {
  LivestockType({super.key});

  @override
  State<LivestockType> createState() => _LivestockTypeState();
}

class _LivestockTypeState extends State<LivestockType> {
  List<Livestock> livestockList = [];
  final service = LivestockService();

  @override
  initState() {
    super.initState();
    service.fetchList().then((fetchedList) {
      setState(() {
        livestockList = fetchedList.data;
      });
    });
  }

  void _show() {
    final nameController = TextEditingController();
    final typeController = TextEditingController();
    final genusController = TextEditingController();
    final speciesController = TextEditingController();
    final ageController = TextEditingController();
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
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: typeController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Type'),
            ),
            TextField(
              controller: genusController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Genus'),
            ),
            TextField(
              controller: speciesController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Species'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  final newLivestock = Livestock(
                      name: nameController.text,
                      type: typeController.text,
                      genus: genusController.text,
                      species: speciesController.text,
                      age: ageController.text);
                  service.insertLivestock(
                      newLivestock.name,
                      newLivestock.type,
                      newLivestock.genus,
                      newLivestock.species,
                      newLivestock.age);
                  setState(() {
                    livestockList.add(newLivestock);
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
        title: Text("Livestock"),
      ),
      body: ListView.builder(
          itemCount: livestockList.length,
          itemBuilder: (context, index) {
            Livestock livestock = livestockList[index];
            return Card(
              child: Text(
                "Name:${livestock.name} | Age: ${livestock.age} | Type:${livestock.type} -> ${livestock.genus} ${livestock.species}",
                style: TextStyle(fontSize: 13),
              ),
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
