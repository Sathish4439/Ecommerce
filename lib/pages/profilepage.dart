import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newrestapp/util/util.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
              const Text(
                "My Profile",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text(
                  "Sathish",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                subtitle: Text("aravindsathish0885@gmail.com"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => Profilepage())),
                  );
                },
                leading: Icon(Icons.person, size: 40),
                title: const Text("My Orders"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.home, size: 40),
                title: const Text("Shipping address"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.shopping_cart, size: 40),
                title: const Text("Payment Methods"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.rate_review, size: 40),
                title: const Text("Promocodes"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.contact_emergency, size: 40),
                title: const Text("Myreviews"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.info_outline, size: 40),
                title: const Text("Settings"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.logout, size: 40),
                title: const Text("Logout"),
                subtitle: const Text("data"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
