import 'shipment.dart';

class ShipmentList {
  ShipmentList(this.data);
  final List<Shipment> data;

  factory ShipmentList.fromJSON(List<dynamic> json) {
    final list = json;
    List<Shipment> livestockList = [];
    for (int i = 0; i < list.length; i++) {
      final livestock = Shipment.fromJSON(list[i]);
      livestockList.add(livestock);
    }
    final retList = livestockList.toList();
    return ShipmentList(retList);
  }

  factory ShipmentList.fromFullJSON(dynamic json) {
    final list = json["data"] as List<dynamic>;
    return ShipmentList.fromJSON(list);
  }
}
