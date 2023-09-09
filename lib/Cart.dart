// Our Cart Page

import 'package:flutter/material.dart';


List<String> myCart = [];

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontFamily: "Poppins-Regular",
            fontSize: 30,
            color: Colors.green,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: queryData.size.height-100,
          width: queryData.size.width,
          child: ListView(
            children: [
              Material(
                elevation: 4,
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Burger',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Material(
                elevation: 4,
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'CFI Tshirt',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Material(
                elevation: 4,
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Nike',
                      style: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                    onPressed: () {},
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
