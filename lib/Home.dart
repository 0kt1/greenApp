import 'package:flutter/material.dart';
import 'package:greenshop/Cart.dart';
import 'package:greenshop/Product.dart';


//Our Home Page
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Our Random Data For Products
  Map<String, List> data1 = {

    "Food": [
      Product("Sandwich", 1, 650),
      Product("Pizza", 5, 300),
      Product("Chips", 5, 400),
      Product("Burger", 8, 200),
      Product("French Fries", 10, 430),
    ],
    "Tshirts": [
      Product("TEchSoc Tshirt", 1, 800),
      Product("CFI Tshirt", 3, 1000),
      Product("Collar shirt", 3,1500),
      Product("Raymond", 4,2000),
      Product("full sleves", 9, 2030),
    ],
    "Shoes": [
      Product("Nike", 2, 193),
      Product("Adidas", 4, 456),
      Product("SparX", 6, 789),
      Product("Wood LAnd",8, 159),
      Product("Sneakers", 10, 200753),
    ],
    "SkinCare": [
      Product("MamaEarth",1, 1465),
      Product("Himalaya", 3, 65456),
      Product("Garnier", 5, 486),
      Product("Ponds",7, 478),
      Product("Patanjali", 9, 138),
    ],


  };

  //Default DropDownValue
  String dropdownValue = 'CO2 Index';
  
  @override
  Widget build(BuildContext context) {

    //Defining Device Height and Width
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        title: SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                const Text(
                    'GreenShop',
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: "Poppins-Regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    width: queryData.size.width,
                    //color: Colors.white,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Compare the prices and CO2 Index of the products and choose the best eco-friendly product !",
                            style: TextStyle(
                              //color: Colors.black,
                              fontFamily: "Poppins-Regular",
                              fontSize: 20,
                            ),
                          )
                        ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Data(queryData: queryData, color: Colors.purpleAccent, dropdownvalue: dropdownValue, data: data1["Food"], title: 'Food',),
            Data(queryData: queryData, color: Colors.blue, dropdownvalue: dropdownValue, data: data1["Tshirts"], title: 'T Shrits',),
            Data(queryData: queryData, color: Colors.amberAccent, dropdownvalue: dropdownValue, data: data1["Shoes"], title: 'Shoes',),
            Data(queryData: queryData, color: Colors.brown, dropdownvalue: dropdownValue, data: data1["SkinCare"], title: 'Skin Care',),
          ],
        ),
      ),

      //Floating Action Button To Navigate To Cart
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cart()),
          );
        },
        child: const Icon(
            Icons.shopping_cart,
          size: 30,
          color: Colors.green,
        ),
      ),
    );
  }
}







// ignore: must_be_immutable
class Data extends StatefulWidget {

  //Data
  Data({Key? key, required this.queryData, required this.data, required this.color, required this.dropdownvalue, required this.title}) : super(key: key);

  final String title;
  final MediaQueryData queryData;
  final List? data;
  final Color color;
  String dropdownvalue;





  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {


  //Sorting The Products According To Price And CO2 Index
  void sort(filter) {

    if (filter == "Cost"){
      widget.data!.sort((a, b) => a.price.compareTo(b.price));
    }
    if (filter == "CO2 Index"){
      widget.data!.sort((a, b) => a.CO2Index.compareTo(b.CO2Index));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(0.08*0.25*(widget.queryData.size.height)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: "Poppins-Regular",
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                //Dropdown Button
                child: DropdownButton<String>(
                  underline: Container(height: 0.0,),
                  borderRadius: BorderRadius.circular(18),
                  iconSize: 30,
                  onChanged: (String? newValue){
                    setState(() {
                      widget.dropdownvalue = newValue!;
                      sort(widget.dropdownvalue);
                    });
                  },
                  icon: const Icon(Icons.filter_alt_rounded),
                  items: const[
                    DropdownMenuItem<String>(value: 'CO2 Index',child: Text("CO2 Index")),
                    DropdownMenuItem<String>(value: 'Cost',child: Text("Cost")),
                  ],
                  style: const TextStyle(
                    fontFamily: "Poppins-Regular",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Representing Product Details In A Sized Box With A Image At Top
        SizedBox(
          height: 200,
          width: widget.queryData.size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.data!.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              //Gesture Detector To Add Product To Cart
              child: GestureDetector(
                onTap: addtocart(e.title),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                            color: widget.color,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins-Regular",
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "CO2 index: " ,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins-Regular",
                              ),
                            ),
                            Text(
                              e.CO2Index.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins-Regular",
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Price: " ,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins-Regular",
                              ),
                            ),
                            Text(
                              e.price.toString(),
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15,
                                fontFamily: "Poppins-Regular",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )).toList(),
          ),
        )
      ],
    );
  }

  //My Cart
  var myCart = [];

  //Method To Add Product To Cart
  addtocart(value) {
    myCart.add(value);
  }

}
