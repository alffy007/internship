import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodOptions extends StatefulWidget {
  const FoodOptions({super.key});

  @override
  State<FoodOptions> createState() => _FoodOptionsState();
}

class _FoodOptionsState extends State<FoodOptions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20, left: 20),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 50,
              height: 40,
              child: Center(
                child: Text(
                  'All',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          PhysicalModel(
            color: Color.fromARGB(255, 249, 73, 79),
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 90,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/pizza.png',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pizza',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          PhysicalModel(
            color: Colors.white,
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 60,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  'assets/images/chicken-leg.png',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          PhysicalModel(
            color: Colors.white,
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 60,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  'assets/images/burger.png',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          PhysicalModel(
            color: Colors.white,
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 60,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  'assets/images/lettuce.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
