import 'package:flutter/material.dart';

class HeroModel extends StatelessWidget {
  final List<dynamic> list;

  const HeroModel({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final hero = list[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(hero['imageurl']),
            ),
            title: Text(hero['name']),
          ),
        );
      },
    );
  }
}
