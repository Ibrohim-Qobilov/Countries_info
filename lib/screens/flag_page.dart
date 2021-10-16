import 'dart:convert';

import 'package:dars40/model/country_model.dart';
import 'package:dars40/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlagPage extends StatefulWidget {
  const FlagPage({Key? key}) : super(key: key);

  @override
  State<FlagPage> createState() => _FlagPageState();
}

class _FlagPageState extends State<FlagPage> {
  var _searchController = TextEditingController();
  List<Countries>? data;

  List _filledCountry = [];
  List emptyCountry = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sizeBox(),
            _country(),
            _sizeBox(),
            _findText(),
            _searchCountry(),
            _divider(),
            _columnText(),
            _sizeBox(),
            _topCountry(),
            _rowText(),
            _sizeBox(),
            Container(
              width: 400,
              height: 200,
              child: ListView.builder(
                  itemCount: emptyCountry.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1634172681884-dc626c952d37?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                emptyCountry[0],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }

  Row _rowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Top rated",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "dars40",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            "View All",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontFamily: "dars40",
            ),
          ),
        ),
      ],
    );
  }

  Container _topCountry() {
    return Container(
        height: 180,
        child: FutureBuilder(
            future: _getDataCountry(),
            builder: (context, AsyncSnapshot<List<Countries>> snap) {
              data = snap.data;
              // print(data.toString());
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    _filledCountry.add(data![index].name!.common);
                    _filledCountry.add(data![index].name!.nativeName);
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Container(
                            height: 200,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1634172681884-dc626c952d37?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    snap.data![index].name!.common.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "4.2-0.3 mil",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SecondPage(snap.data![index]),
                                ));
                          },
                        ));
                  });
            }));
  }

  Column _columnText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Nearby Countries",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "dars40",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "View All",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontFamily: "dars40",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text("Near fron Alilison Park, PA 15101"),
        )
      ],
    );
  }

  Padding _searchCountry() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                emptyCountry = [];
                for (int i = 0; i <= 10; i++) {
                  if (_searchController.text == _filledCountry[i]) {
                    emptyCountry.add(_filledCountry[i]);
                    setState(() {});
                    break;
                  }
                }
              },
              icon: Icon(Icons.search),
            ),
            hintText: "Type to search"),
      ),
    );
  }

  Padding _findText() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text("Find a place to play golf"),
    );
  }

  Padding _country() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        "Countries",
        style: TextStyle(
          fontFamily: "dars40",
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }

  Divider _divider() {
    return Divider();
  }

  SizedBox _sizeBox() {
    return const SizedBox(
      height: 20,
    );
  }

  Future<List<Countries>> _getDataCountry() async {
    Uri url = Uri.parse("https://restcountries.com/v3.1/all");

    var res = await http.get(url);
    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor ${res.statusCode}");
    }
  }
}
