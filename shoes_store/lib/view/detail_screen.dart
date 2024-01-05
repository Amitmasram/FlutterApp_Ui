import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_store/data/data.dart';

class DetailScreen extends StatefulWidget {
  final Data datalist;
  const DetailScreen({super.key, required this.datalist});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<int> size = [40, 41, 42, 43];

  int initialSize = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(137, 99, 97, 97), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.black))
                ],
              ),
              const SizedBox(height: 50),
              Hero(
                  tag: widget.datalist.imgUrl,
                  child: Image.asset(widget.datalist.imgUrl)),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(widget.datalist.title,
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    widget.datalist.price,
                    style: GoogleFonts.robotoSlab(
                        letterSpacing: 1,
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '(5)',
                    style: GoogleFonts.notoSansTifinagh(
                        fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star,
                          color: Colors.amber, size: 25.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  size.length,
                  (index) => GestureDetector(
                    onTap: () => setState(() {
                      initialSize = size[index];
                    }),
                    child: Container(
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 15),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: initialSize == size[index]
                              ? Colors.white
                              : Colors.red[100]),
                      child: Center(
                        child: Text(
                          size[index].toString(),
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '${widget.datalist.title} shoes primarily designed for sports or other forms of physical exercise but which are also widely used for everyday casual wear.',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.merriweather(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
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
