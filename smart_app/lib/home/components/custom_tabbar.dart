import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Container(
          height: 75,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlueAccent,
            ),
            labelColor: Colors.white,
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            unselectedLabelColor: Colors.white,
            tabs: [
              const Tab(
                text: 'Energy',
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("13.5 kmph",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    Text("Energy Usage of Light",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
