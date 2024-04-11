import 'package:flutter/material.dart';
import 'package:newrestapp/pages/contentbox.dart';
import 'package:newrestapp/util/util.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController Address = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController State = TextEditingController();
    TextEditingController Zipcode = TextEditingController();
    TextEditingController country = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Add New Shipping Address",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          ContentBox(
              controller: fullname, hintText: "Full name", obscure: false),
          ContentBox(controller: Address, hintText: "Address", obscure: false),
          ContentBox(controller: city, hintText: "city", obscure: false),
          ContentBox(controller: State, hintText: "State/Provision/Region", obscure: false),
          ContentBox(controller: Zipcode, hintText: "Zipcode", obscure: false),
          ContentBox(controller: country, hintText: "country", obscure: false),
          MyBotton(text: "Save Address", onTap: () {})
        ],
      ),
      
    );
  }
}
