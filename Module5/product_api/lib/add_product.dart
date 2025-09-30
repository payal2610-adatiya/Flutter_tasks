import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:product_api/dashboard.dart';

class AddproductScreen extends StatefulWidget {
  const AddproductScreen({super.key});

  @override
  State<AddproductScreen> createState() => _AddproductScreenState();
}

class _AddproductScreenState extends State<AddproductScreen> {
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  File _imageFile = File("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: pname,
                decoration: const InputDecoration(hintText: "Enter Product Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pprice,
                decoration: const InputDecoration(hintText: "Enter Product Price"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pdes,
                decoration: const InputDecoration(hintText: "Enter Product Description"),
              ),
              const SizedBox(height: 10),

              // Show selected image preview
              _imageFile.path.isNotEmpty
                  ? Image.file(_imageFile, height: 150)
                  : const Text("No image selected"),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Choose Image"),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  String name = pname.text.trim();
                  String price = pprice.text.trim();
                  String des = pdes.text.trim();

                  if (name.isEmpty || price.isEmpty || des.isEmpty || _imageFile.path.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields and select image")),
                    );
                    return;
                  }

                  addproduct(name, price, des);
                },
                child: const Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Pick image from gallery
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  /// Upload product with image
  Future<void> addproduct(String name, String price, String des) async {
    try {
      var url = Uri.parse("https://prakrutitech.xyz/API/productinsert.php");

      var request = http.MultipartRequest("POST", url)
        ..fields["product_name"] = name
        ..fields["product_price"] = price
        ..fields["product_description"] = des
        ..files.add(await http.MultipartFile.fromPath("product_img", _imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added successfully")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add product. Code: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong")),
      );
    }
  }
}
