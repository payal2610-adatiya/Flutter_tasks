import 'package:flutter/material.dart';

class MyModel extends StatelessWidget {
  final List list;
  const MyModel({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var a = list[index];
        return Card(
          child: ListTile(
            title: Text(
              "UserId: ${a["userId"]}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${a["id"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Title: ${a["title"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Body: ${a["body"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
