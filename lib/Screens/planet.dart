import 'dart:convert';

import 'package:animation/Model/datamodel.dart';
import 'package:animation/Model/jesonmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Provider/theme.dart';

class planet extends StatefulWidget {
  const planet({super.key});

  @override
  State<planet> createState() => _planetState();
}

class _planetState extends State<planet> {
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
                  child: Text(
                    "Planets",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Expanded(
                flex: 20,
                child: FutureBuilder(
                  future: rootBundle.loadString("lib/Json/data.json"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.hasError.toString());
                    } else if (snapshot.hasData) {
                      String jsondata = snapshot.data;
                      List maydata = jsonDecode(jsondata);
                      List<jsonmodel> data = maydata
                          .map(
                            (e) => jsonmodel.js(data: e),
                          )
                          .toList();
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 180,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 3,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              datamodel d1 = datamodel(
                                  Name: maydata[index]['Name'],
                                  details: maydata[index]['details'],
                                  distancefromsun: maydata[index]
                                      ['distancefromsun'],
                                  length: maydata[index]['length'],
                                  planettype: maydata[index]['planettype'],
                                  Image: maydata[index]['Image']);
                              Navigator.pushNamed(context, 'detail',
                                  arguments: d1);
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 120,
                                    child: Image.asset(
                                      maydata[index]['Image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(maydata[index]['Name'])
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
