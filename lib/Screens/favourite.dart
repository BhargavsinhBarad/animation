import 'package:animation/Utils/List.dart';
import 'package:flutter/material.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
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
          (addFavourite.isNotEmpty)
              ? Column(
                  children: addFavourite
                      .map(
                        (e) => Container(
                          child: Row(
                            children: [
                              // Container(
                              //   height: 100,
                              //   width: 100,
                              //   child: Image.asset(
                              //     e['Image'],
                              //   ),
                              // ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(e['Name']),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                )
              : Container(),
        ],
      ),
    );
  }
}
