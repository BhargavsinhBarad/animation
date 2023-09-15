import 'package:animation/Model/datamodel.dart';
import 'package:animation/Utils/List.dart';
import 'package:flutter/material.dart';

import '../Model/jesonmodel.dart';

class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
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
              "https://img.freepik.com/premium-photo/starry-night-sky-background-illustration_53876-150103.jpg",
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
                    style: TextStyle(fontSize: 25),
                  )),
              Expanded(
                flex: 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          // color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(e.Image),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: Text(e.details),
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
                            Text(">  Distance from sun : ${e.distancefromsun}"),
                            Text(">  Length: ${e.length}"),
                            Text(">  Planet Type: ${e.planettype}"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              addFavourite.add(e);
                            },
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              "Add to Favourite",
                              style: TextStyle(fontSize: 22),
                            ))),
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
