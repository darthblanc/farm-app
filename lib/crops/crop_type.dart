import 'package:farm_app/crops/crop.dart';
import 'package:farm_app/crops/crop_service.dart';
import 'package:flutter/material.dart';

class CropType extends StatefulWidget {
  CropType({super.key});

  @override
  State<CropType> createState() => _LivestockTypeState();
}

class _LivestockTypeState extends State<CropType> {
  List<Crop> cropList = [];
  final service = CropService();

  @override
  initState() {
    super.initState();
    service.fetchList().then((fetchedList) {
      setState(() {
        cropList = fetchedList.data;
      });
    });
  }

  void _show() {
    final nameController = TextEditingController();
    final typeController = TextEditingController();
    final genusController = TextEditingController();
    final speciesController = TextEditingController();
    final areaController = TextEditingController();
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
              controller: areaController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  final newLivestock = Crop(
                      type: typeController.text,
                      genus: genusController.text,
                      species: speciesController.text,
                      area: areaController.text);
                  service.insertCrop(newLivestock.type, newLivestock.genus,
                      newLivestock.species, newLivestock.area);
                  setState(() {
                    cropList.add(newLivestock);
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
        title: Text("Crops"),
      ),
      body: ListView.builder(
          itemCount: cropList.length,
          itemBuilder: (context, index) {
            Crop crop = cropList[index];
            return Card(
              child: Text(
                  "Group:${crop.type} | Area:${crop.area} | Type: ${crop.genus}, ${crop.species}"),
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
