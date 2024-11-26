import 'livestock.dart';

class LivestockList {
  LivestockList(this.data);
  final List<Livestock> data;

  factory LivestockList.fromJSON(List<dynamic> json) {
    final list = json;
    List<Livestock> livestockList = [];
    for (int i = 0; i < list.length; i++) {
      final livestock = Livestock.fromJSON(list[i]);
      livestockList.add(livestock);
    }
    final retList = livestockList.toList();
    return LivestockList(retList);
  }

  factory LivestockList.fromFullJSON(dynamic json) {
    final list = json["data"] as List<dynamic>;
    return LivestockList.fromJSON(list);
  }
}
