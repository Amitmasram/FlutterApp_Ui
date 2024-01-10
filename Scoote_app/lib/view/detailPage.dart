import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final heroTag;

  const DetailPage({super.key, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222022),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                const Icon(Icons.more_horiz, color: Colors.white, size: 35)
              ],
            ),
            const SizedBox(height: 50),
            Hero(
              tag: heroTag,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(heroTag), fit: BoxFit.cover)),
                child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.3)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF4e4d4e)),
                      child:
                          const Icon(Icons.shutter_speed, color: Colors.white)),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Top Speed",
                          style: GoogleFonts.poppins(
                              color: Colors.amber, fontSize: 17)),
                      Text("45 km/h",
                          style: GoogleFonts.oswald(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF4e4d4e)),
                      child: const Icon(Icons.flash_on, color: Colors.white)),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Power",
                          style: GoogleFonts.poppins(
                              color: Colors.amber, fontSize: 17)),
                      Text("3 kw",
                          style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 15, top: 35),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF4e4d4e)),
                          child: const Icon(Icons.location_on,
                              color: Colors.white)),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Range",
                              style: GoogleFonts.poppins(
                                  color: Colors.amber, fontSize: 17)),
                          Text("100 km",
                              style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF4e4d4e)),
                          child: const Icon(Icons.battery_charging_full,
                              color: Colors.white)),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Charge",
                              style: GoogleFonts.poppins(
                                  color: Colors.amber, fontSize: 17)),
                          Text("7 hours",
                              style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CityRover Scooter",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Matte Black",
                                  style: GoogleFonts.poppins(
                                      color: Colors.red[100], fontSize: 15)),
                              const SizedBox(width: 20),
                              const Icon(Icons.brightness_1,
                                  color: Color(0xFF4e4d4e), size: 6),
                              const SizedBox(width: 20),
                              Text("Standard",
                                  style: GoogleFonts.poppins(
                                      color: Colors.red[100], fontSize: 15))
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFff583b)),
                        child: const Center(
                          child: Icon(Icons.shopping_cart,
                              color: Colors.white, size: 30),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                      "With a clean electric motor, portable battery,integrated navigation, shareale digital key and plenty of space for your stuff.",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
