import 'package:flutter/material.dart';

class MyModel extends StatelessWidget {

  List list;
  MyModel({required this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
        itemBuilder:(context,index){
          var a=list[index];
          return Card(
          child: ListTile(
            leading: Image.network(a["imageurl"], ),
            title: Text(a["name"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Real Name: ${a["realname"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Team: ${a["team"]}",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("First Appearance: ${a["firstappearance"]}",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Created By: ${a["createdby"]}",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Publisher: ${a["publisher"]}",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Bio:",style: TextStyle(fontWeight: FontWeight.bold),), Text("${a["bio"]}")
              ],
            ),

          )
          );
        }
        );
  }
}
