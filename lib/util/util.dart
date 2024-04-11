import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newrestapp/pages/cart_page.dart';
import 'package:newrestapp/pages/profilepage.dart';

class MyBotton extends StatelessWidget {
  void Function()? onTap;
  String text;
  MyBotton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

var carosal = CarouselSlider(
  options: CarouselOptions(
    height: 200,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
  ),
  items: [
    Carosalcomponent(
        url:
            "https://img.freepik.com/free-psd/banner-template-online-shopping_23-2148559048.jpg"),
    Carosalcomponent(
        url:
            "https://img.freepik.com/free-psd/sales-horizontal-banner-template_23-2148912910.jpg"),
    Carosalcomponent(
        url:
            "https://img.freepik.com/free-psd/online-shopping-banner-template_23-2148582750.jpg"),
    Carosalcomponent(
        url:
            "https://img.freepik.com/free-psd/sales-horizontal-banner-template_23-2148912910.jpg"),
    Carosalcomponent(
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuE2-9Fd9GyA5Gjfq09aqVkJ3PbcYIzRRGuw7R7UjeplCa6VgaCIxk70WfxENqCeRbLuI&usqp=CAU"),
  ],
);

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Profilepage())));
            },
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            leading: const Icon(Icons.shopping_cart),
            title: Text("Orders"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.rate_review),
            title: Text("Rateing"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.contact_emergency),
            title: Text("Contact"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.info_outline),
            title: Text("About us"),
          ),
          Spacer(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

class Myappbar extends StatelessWidget {
  const Myappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Shoping page"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}

class Carosalcomponent extends StatelessWidget {
  String url;
  Carosalcomponent({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}