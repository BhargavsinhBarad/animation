import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/theme.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://img.freepik.com/premium-photo/starry-night-sky-background-illustration_53876-150103.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * 2 * pi,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset("lib/Assets/9.png"),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'planet');
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 25),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'favourite');
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Favourite",
                        style: TextStyle(fontSize: 25),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {
                    Provider.of<themeprovider>(context, listen: false)
                        .changetheme();
                  },
                  icon: Icon(
                    Icons.bedtime_sharp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
