import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String city;

  const MainScreen({super.key, required this.city});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'name': 'Milk',
      'price': 30.0,
      'image': 'assets/milk.png',
    },
    {
      'id': '2',
      'name': 'Cheese',
      'price': 130.0,
      'image': 'assets/cheese.jpeg',
    },
    {
      'id': '3',
      'name': 'Butter',
      'price': 100.0,
      'image': 'assets/butter.jpeg',
    },
    {
      'id': '4',
      'name': 'Yogurt',
      'price': 50.0,
      'image': 'assets/yogurt.jpeg',
    },
    {
      'id': '5',
      'name': 'Paneer',
      'price': 150.0,
      'image': 'assets/paneer.jpeg',
    },
    {
      'id': '6',
      'name': 'Ghee',
      'price': 500.0,
      'image': 'assets/ghee.jpeg',
    },
    {
      'id': '7',
      'name': 'ButterMilk',
      'price': 30.0,
      'image': 'assets/buttermilk.jpeg',
    },
    {
      'id': '8',
      'name': 'Cheese Spread',
      'price': 100.0,
      'image': 'assets/cheesespread.jpeg',
    },
    {
      'id': '9',
      'name': 'Masala ButterMilk',
      'price': 20.0,
      'image': 'assets/masalabuttermilk.jpeg',
    },
    {
      'id': '10',
      'name': 'Chocolate',
      'price': 150.0,
      'image': 'assets/chocolate.jpeg',
    },
    {
      'id': '11',
      'name': 'Cool Milk',
      'price': 25.0,
      'image': 'assets/cool.jpeg',
    },
    {
      'id': '12',
      'name': 'Dahi',
      'price': 20.0,
      'image': 'assets/dahi.jpeg',
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome!'),
          content: Text('Thanks for using our Dairy App. Enjoy fresh dairy products at your doorstep in ${widget.city}!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                product['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹${product['price'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF4CAF50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.brown,
                  // child: Text
                  //   (
                  //   "PA",
                  //   style: TextStyle(fontSize: 40.0),
                  // ),
                  backgroundImage: AssetImage('assets/me.jpg'),
                ),
                SizedBox(height: 8),
                Text(
                  'Payal Adatiya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'payal.@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My Orders'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dairy Products'),
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => _buildProductCard(products[index]),
        ),
      ),
    );
  }
}