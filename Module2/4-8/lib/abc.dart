import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Individual menu items with selection status
  bool isCoffeeSelected = false;
  bool isTeaSelected = false;
  bool isSandwichSelected = false;
  bool isCakeSelected = false;

  // Prices of the items
  final double coffeePrice = 50;
  final double teaPrice = 20;
  final double sandwichPrice = 120;
  final double cakePrice = 300;

  // Calculate total amount
  double getTotal() {
    double total = 0;
    if (isCoffeeSelected) total += coffeePrice;
    if (isTeaSelected) total += teaPrice;
    if (isSandwichSelected) total += sandwichPrice;
    if (isCakeSelected) total += cakePrice;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Order App")),
      body: Column(
        children: [
          // Menu items list
          Expanded(
            child: ListView(
              children: [
                CheckboxListTile(
                  title: Text("Coffee"),
                  subtitle: Text("$coffeePrice"),
                  value: isCoffeeSelected,
                  onChanged: (val) {
                    setState(() {
                      isCoffeeSelected = val!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tea"),
                  subtitle: Text("$teaPrice"),
                  value: isTeaSelected,
                  onChanged: (val) {
                    setState(() {
                      isTeaSelected = val!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Sandwich"),
                  subtitle: Text("$sandwichPrice"),
                  value: isSandwichSelected,
                  onChanged: (val) {
                    setState(() {
                      isSandwichSelected = val!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Cake"),
                  subtitle: Text("$cakePrice"),
                  value: isCakeSelected,
                  onChanged: (val) {
                    setState(() {
                      isCakeSelected = val!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Total and Generate Bill button
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total: ${getTotal().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text("Generate Bill"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Your Bill"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isCoffeeSelected) Text("Coffee - $coffeePrice"),
                            if (isTeaSelected) Text("Tea - $teaPrice"),
                            if (isSandwichSelected) Text("Sandwich - $sandwichPrice"),
                            if (isCakeSelected) Text("Cake - $cakePrice"),
                            Divider(),
                            Text("Total: ${getTotal().toStringAsFixed(2)}"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}