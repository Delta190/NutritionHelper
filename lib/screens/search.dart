// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:nutritionhelperuimodule/screens/account.dart';
import 'package:nutritionhelperuimodule/screens/favourites.dart';
import 'package:nutritionhelperuimodule/screens/nutritionlog.dart';
import 'package:nutritionhelperuimodule/screens/home.dart';
import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  String brand;

  Product({required this.id, required this.name, required this.brand});
}

final List<Product> products = [
  Product(id: 1, name: "Product A", brand: "Brand X"),
  Product(id: 2, name: "Product B", brand: "Brand Y"),
  Product(id: 3, name: "Product C", brand: "Brand Z"),
  Product(id: 4, name: "Product D", brand: "Brand X"),
  Product(id: 5, name: "Product E", brand: "Brand Y"),
];

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 0;
  String _searchText = "";
  List<Product> _filteredProducts = [];

  void _filterProducts(String searchText) {
    setState(() {
      _filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NutritionLog()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FavouritePage()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe8e2e2),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Log"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          backgroundColor: Color(0xffffffff),
          currentIndex: _currentIndex,
          elevation: 8,
          iconSize: 24,
          selectedItemColor: Color(0xff23bf49),
          unselectedItemColor: Color(0xff9e9e9e),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: onTabTapped,
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(alignment: Alignment.topLeft, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                    ),
                    child: TextField(
                      //controller: TextEditingController(),
                      onChanged: (value) {
                        _searchText = value;
                        _filterProducts(_searchText);
                      },
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Color(0x00000000), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Color(0x00000000), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Color(0x00000000), width: 1),
                        ),
                        hintText: "Search by product name...",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        isDense: false,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        prefixIcon: Icon(Icons.search,
                            color: Color(0xff212435), size: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            // Do something when the button is pressed
                          },
                          child: Text(_filteredProducts[index].name),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ])));
  }
}
