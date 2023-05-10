// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:nutritionhelperuimodule/hivetables/producttable.dart';
import 'package:nutritionhelperuimodule/screens/account.dart';
import 'package:nutritionhelperuimodule/screens/favourites.dart';
import 'package:nutritionhelperuimodule/screens/nutritionlog.dart';
import 'package:nutritionhelperuimodule/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nutritionhelperuimodule/hivetables/DBInteraction.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 0;
  String _searchText = "";
  List<String> _matchingProductNames = [];

  void _filterProducts(String searchText) {
    setState(() {
      _matchingProductNames = retrievalquery(searchText);
    });
  }

  List<String> retrievalquery(String searchText) {
    final productBox = Hive.box<Product>('product');
    final allProducts = productBox.values.toList();
    final matchingProducts =
        allProducts.where((p) => p.name.contains(searchText)).toList();
    final matchingProductNames = matchingProducts.map((p) => p.name).toList();
    return matchingProductNames;
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
                        retrievalquery(_searchText);
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
                      itemCount: _matchingProductNames.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            // Do something when the button is pressed
                          },
                          child: Text(_matchingProductNames[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ])));
  }
}
