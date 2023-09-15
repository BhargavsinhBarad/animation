import 'package:animation/Utils/List.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/theme.dart';

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
                child: Container(
                  child: Center(
                    child: Text(
                      "Favourite",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: (addFavourite.isNotEmpty)
                    ? ListView.builder(
                        itemCount: addFavourite.length,
                        itemBuilder: (ctx, i) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        addFavourite[i].Image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                    ),
                                    Text(
                                      addFavourite[i].Name,
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            addFavourite
                                                .remove(addFavourite[i]);
                                          });
                                        },
                                        icon: Icon(Icons.cancel_outlined))
                                  ],
                                ),
                              ),
                            ],
                          );
                        })
                    : Center(
                        child: Container(
                          child: Text("Empty....."),
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
