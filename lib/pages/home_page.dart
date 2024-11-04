import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Sample data for products
  final List<Map<String, String>> products = [
    {
      'title': 'Nike Sneakers',
      'price': '\$22.98',
      'imageUrl': 'images/fashion/1.png', // Update with the correct path
    },
    {
      'title': 'Adidas Running Shoes',
      'price': '\$30.00',
      'imageUrl': 'images/fashion/2.png', // Update with the correct path
    },
    {
      'title': 'Puma Casual Shoes',
      'price': '\$25.50',
      'imageUrl': 'images/fashion/3.png', // Update with the correct path
    },
    {
      'title': 'Reebok Sports Shoes',
      'price': '\$27.75',
      'imageUrl': 'images/fashion/4.png', // Update with the correct path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hello, Tameen\nWelcome Back!',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  // Use Expanded to take available space
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What do you need?',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.flash_on, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align items to the start
                children: [
                  CategoryButton(label: 'Popular', icon: Icons.star),
                  SizedBox(width: 8), // Add spacing between buttons
                  CategoryButton(label: 'Trending', icon: Icons.trending_up),
                  SizedBox(width: 8), // Add spacing between buttons
                  CategoryButton(
                      label: 'Most Selling', icon: Icons.local_fire_department),
                  SizedBox(width: 8), // Add spacing between buttons
                  CategoryButton(
                      label: 'Coming Soon', icon: Icons.new_releases),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title']!,
                    price: product['price']!,
                    imageUrl: product['imageUrl']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set background color to white
        selectedItemColor: Color(0xFF3D3D3D), // Set selected item icon color
        unselectedItemColor:
            Color(0xFF3D3D3D), // Set unselected item icon color
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;

  CategoryButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  ProductCard(
      {required this.title, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        width: 182, // Set the width to 182
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!, blurRadius: 6, offset: Offset(0, 4)),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Allow height to be auto
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl,
                fit: BoxFit.cover), // Ensure image fits properly
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

// Placeholder for DetailPage
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
    );
  }
}
