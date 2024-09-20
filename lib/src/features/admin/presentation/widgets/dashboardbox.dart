import 'package:flutter/material.dart';

class Dashboardbox extends StatelessWidget {
  const Dashboardbox(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});
  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color.fromARGB(255, 175, 175, 175)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/$icon.png',
           // width: 60,
            height: 100,
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                value,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 199, 146),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
