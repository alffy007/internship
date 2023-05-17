import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:swiggy_clone/widgets/food_options.dart';
import 'package:swiggy_clone/widgets/nearby_restaurants.dart';

import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, this.lat, this.lon, this.locality, this.sublocal});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  final lat;
  final lon;
  final locality;
  final sublocal;
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const HomeScreen();
      } else if (index == 1) {
        _selectedWidget = const HomeScreen();
      } else if (index == 2) {
        _selectedWidget = const HomeScreen();
      } else if (index == 3) {
        _selectedWidget = const HomeScreen();
      } else if (index == 4) {
        _selectedWidget = const HomeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DiamondBottomNavigation( //bottom navigation bar
        itemIcons: const [
          Icons.dashboard_rounded,
          Icons.video_label_rounded,
          Icons.bookmark,
          Icons.person_outline,
        ],
        unselectedColor: const Color(0xFFe26b6f),
        selectedColor: const Color(0xFFdc0000),
        centerIcon: Icons.qr_code_scanner_sharp,
        selectedIndex: _selectedIndex,
        selectedLightColor: const Color(0xFFdc0000),
        onItemPressed: onPressed,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          backgroundBlendMode: BlendMode.multiply,
          gradient: LinearGradient(colors: [
            Color(0xFFD37272),
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(                                                       ///location
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.place),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.sublocal},${widget.locality}',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(                                                       ///stories
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'Stories',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5),
                  ),
                ),
              ),
              const ServiceWidget2(),                                      ///stories listview 
              const Padding(                                               ///searchbar
                padding: EdgeInsets.all(15.0),
                child: SearchBar(
                  leading: Icon(Icons.search),
                  hintText: 'Search Food Items',
                  hintStyle: MaterialStatePropertyAll(
                    TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const Padding(                                               ///option buttons
                padding: EdgeInsets.only(top: 10),
                child: FoodOptions(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Nearby Restaurants',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5),
                  ),
                ),
              ),
              Nearby(                                                        //nearby hotels widget
                lat: widget.lat,
                lon: widget.lon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
