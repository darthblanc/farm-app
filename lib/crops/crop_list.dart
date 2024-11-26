import 'crop.dart';

class CropList {
  CropList(this.data);
  final List<Crop> data;

  factory CropList.fromJSON(List<dynamic> json) {
    final list = json;
    List<Crop> livestockList = [];
    for (int i = 0; i < list.length; i++) {
      final livestock = Crop.fromJSON(list[i]);
      livestockList.add(livestock);
    }
    final retList = livestockList.toList();
    return CropList(retList);
  }

  factory CropList.fromFullJSON(dynamic json) {
    final list = json["data"] as List<dynamic>;
    return CropList.fromJSON(list);
  }
}
