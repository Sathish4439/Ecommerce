import 'package:flutter/material.dart';
import 'package:newrestapp/pages/cart_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "My Profile",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: DefaultTabController(
                  length: 3, // Number of tabs
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Delivered'),
                          Tab(text: 'Processing'),
                          Tab(
                            text: "Cancelled",
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Content for the Delivered tab
                            Center(
                              child: Text('Delivered Orders'),
                            ),
                            // Content for the Processing tab
                            Center(
                              child: CartPage(),
                            ),
                            Center(
                              child: Text('Cancelled Orders'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
