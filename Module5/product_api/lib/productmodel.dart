import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/dashboard.dart';
import 'update_product.dart'; // make sure this exists

class ProductModel extends StatelessWidget {
  final List list;
  ProductModel({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var product = list[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: product["product_img"] != null && product["product_img"] != ""
                ? Image.network(
              "https://prakrutitech.xyz/API/${product["product_img"]}",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            )
                : const Icon(Icons.image, size: 50, color: Colors.grey),
            title: Text(
              product["product_name"],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("₹ ${product["product_price"]}"),
                Text(product["product_description"]),
              ],
            ),
            trailing: Wrap(
              spacing: 6,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProduct(
                          id: product["id"],
                          name: product["product_name"],
                          price: product["product_price"],
                          des: product["product_description"],
                          img: product["product_img"], // pass image path
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    deletedata(product["id"]);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Dashboard()),
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void deletedata(id) {
    http.post(
      Uri.parse("https://prakrutitech.xyz/API/productdelete.php"),
      body: {"id": id},
    );
  }
}
