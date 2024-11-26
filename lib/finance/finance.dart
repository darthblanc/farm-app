import 'dart:convert';
import 'package:uuid/uuid.dart';

class Finance {
  const Finance({
    required this.balance,
    required this.debit,
    required this.credit,
  });

  final String balance;
  final String debit;
  final String credit;

  factory Finance.fromJSON(Map<String, dynamic> json) {
    String balance = json["balance"].toString();
    String debit = json["debit"].toString();
    String credit = json["credit"].toString();
    return Finance(balance: balance, debit: debit, credit: credit);
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'id': id,
      'balance': balance,
      'debit': debit,
      'credit': credit,
    };
    return jsonEncode(data);
  }
}
