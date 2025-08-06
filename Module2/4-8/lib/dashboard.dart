import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isCoffeeSelected = false;
  bool isTeaSelected = false;
  bool isPizzaSelected = false;
  bool isSandwichSelected = false;
  bool isPastrySelected = false;

  final double coffeePrice = 50;
  final double teaPrice = 20;
  final double pizzaPrice = 150;
  final double sandwichPrice = 100;
  final double pastryPrice = 60;

  final tableNumberController = TextEditingController();
  int? tableNumber;
  String paymentMethod = 'Cash';

  double getTotal() {
    double total = 0;
    if (isCoffeeSelected) total += coffeePrice;
    if (isTeaSelected) total += teaPrice;
    if (isPizzaSelected) total += pizzaPrice;
    if (isSandwichSelected) total += sandwichPrice;
    if (isPastrySelected) total += pastryPrice;
    return total;
  }

  @override
  void dispose() {
    tableNumberController.dispose();
    super.dispose();
  }

  void _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  void _makeSms(String phoneNumber, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );
    if (await canLaunch(smsUri.toString())) {
      await launch(smsUri.toString());
    } else {
      throw 'Could not send SMS to $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME ADMIN"),
        backgroundColor: Colors.brown[300],
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              _makeCall('8690355858');
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              _makeSms("8690355858", 'Hello! from The Cafe.');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: tableNumberController,
                decoration: InputDecoration(
                  labelText: 'Table Number',
                  border: OutlineInputBorder(),
                  hintText: 'Enter table number',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    tableNumber = int.tryParse(value);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "The Cafe Menu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

              ),
            ),
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
              title: Text("Pizza"),
              subtitle: Text("$pizzaPrice"),
              value: isPizzaSelected,
              onChanged: (val) {
                setState(() {
                  isPizzaSelected = val!;
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
              title: Text("Pastry"),
              subtitle: Text("$pastryPrice"),
              value: isPastrySelected,
              onChanged: (val) {
                setState(() {
                  isPastrySelected = val!;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    "Total: ${getTotal()}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text("Payment Method:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'Cash',
                        groupValue: paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                      Text('Cash'),
                      Radio<String>(
                        value: 'Online',
                        groupValue: paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                      Text('Online'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text("Generate Bill"),
                    onPressed: () {
                      if (tableNumber == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid table number')),
                        );
                        return;
                      }
                      if (!isCoffeeSelected && !isTeaSelected && !isPizzaSelected && !isSandwichSelected && !isPastrySelected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select at least one item to generate the bill')),
                        );
                        return;
                      }

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Table number $tableNumber Bill"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isCoffeeSelected) Text("Coffee - $coffeePrice"),
                              if (isTeaSelected) Text("Tea - $teaPrice"),
                              if (isPizzaSelected) Text("Pizza - $pizzaPrice"),
                              if (isSandwichSelected) Text("Sandwich - $sandwichPrice"),
                              if (isPastrySelected) Text("Pastry - $pastryPrice"),
                              Text("Total Amount: ${getTotal()}"),
                              Text("Payment Method: $paymentMethod"),
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
      ),
    );
  }
}