import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Nearby extends StatefulWidget {
  const Nearby({super.key, this.lat, this.lon});

  final lat;
  final lon;

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  late Future _fetchedData;

  Future fetchRestaurants() async {
    await Future.delayed(Duration(seconds: 5));
    final response = await http.post(
      //fetching API
      Uri.parse('https://theoptimiz.com/restro/public/api/get_resturants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, double>{"lat": widget.lat, "lng": widget.lon}),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List dataList = jsonResponse['data'];
      return dataList;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  FutureBuilder buildFutureBuilder() {
    //building Cards
    return FutureBuilder(
      future: _fetchedData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List datalen = snapshot.data;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: datalen.length,
              itemBuilder: (context, index) {
                String dis = datalen[index]['distance'];
                double km = double.parse(dis) / 1000;
                int distance = km.toInt();
                return hotelCards(
                  datalen[index]['name'],
                  datalen[index]['tags'],
                  datalen[index]['rating'],
                  datalen[index]['discount'],
                  datalen[index]['primary_image'],
                  distance,
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget hotelCards(name, items, rating, disc, img, distance) {
    //cards
    return SizedBox(
      height: 220,
      child: Card(
        elevation: 12,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                    height: 140, width: 400, fit: BoxFit.cover, '$img'),
                Padding(
                  padding: const EdgeInsets.only(left: 290, top: 100),
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 129, 219, 27),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      rating,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5),
                      ),
                    )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5),
                        ),
                      ),
                      Text(
                        items,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.local_offer_sharp,
                            color: Colors.red,
                          ),
                          Text(
                            '$disc% discount',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '$distance Km',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchedData = fetchRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder();
  }
}
