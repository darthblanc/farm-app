import 'package:farm_app/finance/finance_type.dart';
import 'package:flutter/material.dart';

class FinanceHome extends StatelessWidget {
  const FinanceHome({super.key});

  @override
  Widget build(context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      width: MediaQuery.sizeOf(context).width / 2,
      child: Card(
        color: Colors.black,
        child: FloatingActionButton(
          heroTag: "FinanceHome",
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FinanceType()));
          },
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Image.asset(
                "assets/images/cash.jpg",
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                alignment: Alignment.topCenter,
              ),
              const Text(
                "Finances",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
