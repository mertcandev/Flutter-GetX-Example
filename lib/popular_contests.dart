import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularContests extends StatefulWidget {
  const PopularContests({Key? key}) : super(key: key);

  @override
  State<PopularContests> createState() => _PopularContestsState();
}

class _PopularContestsState extends State<PopularContests> {
  List contests = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/details2.json")
        .then((s) {
      setState(() {
        contests = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffcbe6f6),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 100, right: 10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < contests.length; i++)
                    Container(
                        height: 220,
                        margin: EdgeInsets.only(bottom: 30),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/detail", arguments: {
                              "title": contests[i]["title"].toString(),
                              "text": contests[i]["text"].toString(),
                              "name": contests[i]["name"].toString(),
                              "img": contests[i]["img"].toString(),
                              "time": contests[i]["time"].toString(),
                              "prize": contests[i]["prize"].toString(),
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            height: 220,
                            width: MediaQuery.of(context).size.width - 20,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: i.isEven
                                    ? Color(0xFF69c5df)
                                    : Color(0xFF9294cc)),
                            child: Column(
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      contests[i]["title"],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Expanded(child: Container())
                                  ],
                                )),
                                SizedBox(height: 10),
                                Container(
                                  width: width,
                                  child: Text(
                                    contests[i]["text"],
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFFb8eefc)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Row(children: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    contests[i]["img"]),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                ]),
                              ],
                            ),
                          ),
                        )),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
