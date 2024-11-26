import 'dart:convert';
import 'package:farm_app/finance/finance.dart';
import 'finance_list.dart';
import 'package:http/http.dart' as http;

class FinanceService {
  final urlString = "https://api.restpoint.io/api/farm_app_finance";
  final endPointKey = "";
  final headerKey = "x-endpoint-key";

  Future<void> amendFinance(String balance, String credit, String debit) async {
    final finance = Finance(balance: balance, credit: credit, debit: debit);
    final body = finance.toJson();
    final response = await http.post(
      Uri.parse(urlString),
      headers: {
        headerKey: endPointKey,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception("failed to insert ${response.statusCode}");
    }
  }

  Future<FinanceList> fetchList() async {
    final response = await http.get(
      Uri.parse(urlString),
      headers: {
        headerKey: endPointKey,
      },
    );
    if (response.statusCode != 200) {
      throw Exception("failed to fetch ${response.statusCode}");
    }
    final jsonBody = response.body;
    final json = jsonDecode(jsonBody);
    return FinanceList.fromFullJSON(json);
  }
}
