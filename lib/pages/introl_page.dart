import 'package:fashion_store/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntrolPage extends StatelessWidget {
  const IntrolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 40, top: 160),
            child: Container(
              width: 400,
              height: 380,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // Match container border radius
                child: Image.asset(
                  'images/fashion/banner.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Find Your Best Style",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Join and discover the best style according your fashion",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            )),
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFF3D3D3D),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24.0),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
