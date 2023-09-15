import 'dart:math';

import 'package:animation/Model/datamodel.dart';
import 'package:animation/Utils/List.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/jesonmodel.dart';
import '../Provider/theme.dart';

class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    datamodel e = ModalRoute.of(context)!.settings.arguments as datamodel;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              (Provider.of<themeprovider>(context, listen: true).theme.isdark ==
                      true)
                  ? "https://img.freepik.com/premium-photo/nebula-galaxy-background_469558-17578.jpg"
                  : "https://img.freepik.com/premium-photo/starry-night-sky-background-illustration_53876-150103.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    e.Name,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Expanded(
                flex: 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: controller.value * 2 * pi,
                            child: Container(
                              height: 250,
                              padding: EdgeInsets.all(10),
                              child: Image.asset(e.Image),
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: Text(
                          e.details,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ">  Distance from sun : ${e.distancefromsun}",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              ">  Length: ${e.length}",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              ">  Planet Type: ${e.planettype}",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              if (!addFavourite.contains(e)) {
                                addFavourite.add(e);
                              }
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Center(
                            child: Text(
                              "Add to Favourite",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
