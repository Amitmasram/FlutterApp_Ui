import 'package:flutter/material.dart';

class AccountInfoCard extends StatelessWidget {
  final VoidCallback addCallback;
  const AccountInfoCard({super.key, required this.addCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            Text(
              "Hi, Vitaliy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Manage your home",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: addCallback,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Row(
            children: const [
              Icon(Icons.add, color: Colors.white),
              Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
