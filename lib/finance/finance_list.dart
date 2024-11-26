import 'finance.dart';

class FinanceList {
  FinanceList(this.data);
  final List<Finance> data;

  factory FinanceList.fromJSON(List<dynamic> json) {
    final list = json;
    List<Finance> financeList = [];
    for (int i = 0; i < list.length; i++) {
      final finance = Finance.fromJSON(list[i]);
      financeList.add(finance);
    }
    final retList = financeList.toList();
    return FinanceList(retList);
  }

  factory FinanceList.fromFullJSON(dynamic json) {
    final list = json["data"] as List<dynamic>;
    return FinanceList.fromJSON(list);
  }
}
