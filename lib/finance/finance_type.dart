import 'package:farm_app/finance/finance.dart';
import 'package:farm_app/finance/finance_service.dart';
import 'package:flutter/material.dart';

class FinanceType extends StatefulWidget {
  const FinanceType({super.key});

  @override
  State<FinanceType> createState() => _FinanceTypeState();
}

class _FinanceTypeState extends State<FinanceType> {
  // Finance financeList = Finance(balance: "balance", debit: "debit", credit: "credit");
  String balance = "0";
  String credit = "0";
  String debit = "0";
  final service = FinanceService();

  @override
  initState() {
    super.initState();
    service.fetchList().then((fetchedFinance) {
      setState(() {
        Finance finance = fetchedFinance.data.last;
        balance = finance.balance;
        credit = finance.credit;
        debit = finance.debit;
      });
    });
  }

  void _show() {
    final debitController = TextEditingController();
    final creditController = TextEditingController();

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
              controller: debitController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Debit'),
            ),
            TextField(
              controller: creditController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Credit'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  final financials = Finance(
                    balance:
                        "${int.parse(balance) + (int.parse(debitController.text) - int.parse(creditController.text))}",
                    debit:
                        "${int.parse(debit) + int.parse(debitController.text)}",
                    credit:
                        "${int.parse(credit) + int.parse(creditController.text)}",
                  );
                  service.amendFinance(
                    financials.balance,
                    financials.credit,
                    financials.debit,
                  );
                  setState(() {
                    balance = financials.balance;
                    credit = financials.credit;
                    debit = financials.debit;
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
        title: const Text("Finances"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 10,
                        child: Text(
                          "Balance: $balance",
                          style: const TextStyle(fontSize: 45),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 10,
                            child: Text(
                              "Credit: $credit",
                              style: const TextStyle(fontSize: 45),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 10,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Text("Debit: $debit",
                                style: const TextStyle(fontSize: 45)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: FloatingActionButton(
        onPressed: _show,
        backgroundColor: Colors.white,
        tooltip: "Update finances",
        child: const Icon(Icons.monetization_on),
      ),
    );
  }
}
