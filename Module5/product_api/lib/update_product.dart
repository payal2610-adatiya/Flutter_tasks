import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:product_api/dashboard.dart';

class UpdateProduct extends StatefulWidget {
  final String id;
  final String name;
  final String des;
  final String? img; // image filename/path from API

  final String price;
  const UpdateProduct({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.des,
    this.img,
  });

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  File _imageFile = File(""); // new image
  bool _imageChanged = false;

  @override
  void initState() {
    super.initState();
    pname.text = widget.name;
    pprice.text = widget.price;
    pdes.text = widget.des;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: pname,
                decoration:
                const InputDecoration(hintText: "Enter Product Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pprice,
                decoration:
                const InputDecoration(hintText: "Enter Product Price"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pdes,
                decoration: const InputDecoration(
                    hintText: "Enter Product Description"),
              ),
              const SizedBox(height: 10),

              // Show current image or newly picked one
              _imageChanged
                  ? Image.file(_imageFile, height: 150)
                  : (widget.img != null && widget.img!.isNotEmpty)
                  ? Image.network(
                "https://prakrutitech.xyz/API/${widget.img}",
                height: 150,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 80),
              )
                  : const Icon(Icons.image, size: 80),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Choose New Image"),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  String name = pname.text.trim();
                  String price = pprice.text.trim();
                  String des = pdes.text.trim();

                  await updateProduct(name, price, des, widget.id);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashboard()),
                  );
                },
                child: const Text("Update Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Pick new image
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageChanged = true;
      });
    }
  }

  /// Update API call with/without image
  Future<void> updateProduct(
      String name, String price, String des, String id) async {
    try {
      var url = Uri.parse("https://prakrutitech.xyz/API/productupdate.php");

      var request = http.MultipartRequest("POST", url)
        ..fields["id"] = id
        ..fields["product_name"] = name
        ..fields["product_price"] = price
        ..fields["product_description"] = des;

      // If user selected a new image
      if (_imageChanged && _imageFile.path.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath("product_img", _imageFile.path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product updated successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
              Text("Failed to update product. Code: ${response.statusCode}")),
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
