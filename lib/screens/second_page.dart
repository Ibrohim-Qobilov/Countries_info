import 'dart:convert';
import 'package:dars40/model/country_model.dart';
import 'package:dars40/model/weather_model.dart';
import 'package:dars40/screens/third_page.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  Countries data;
  SecondPage(this.data, {Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Countries? countries;

  @override
  void initState() {
    super.initState();
    countries = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getWeatherData("Seoul"),
          builder: (context, AsyncSnapshot<Weather> snap) {
            var weather = snap.data;
            print("Weat " + weather!.id.toString());
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1634172681884-dc626c952d37?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    left: 20,
                    child: GlassContainer(
                      blur: .1,
                      opacity: 1,
                      shadowStrength: 1,
                      borderRadius: BorderRadius.circular(50),
                      height: 40,
                      width: 40,
                      child: InkWell(
                        child: const Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 450,
                    left: 30,
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/sunny_2d.png",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text("Wind: ${weather.wind.speed} m/s",
                                style: const TextStyle(
                                    color: Colors.yellow, fontSize: 20)),
                            Text(
                              "${weather.name} is ${weather.weather[0].description}",
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.yellow),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 520,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Meadow Springs Golf And\nCountry Club ",
                        style: TextStyle(
                          fontFamily: "dars40",
                          fontSize: 27,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 600,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        countries!.name!.common.toString(),
                        style: const TextStyle(
                          fontFamily: "dars40",
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 670,
                    left: 20,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.white, width: 0.3))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThirdPage(countries!),
                                  ));
                            },
                            child: const Text("Preview"),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.white, width: 0.3))),
                            onPressed: () {},
                            child: const Text("Start Round"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<Weather> getWeatherData(String capital) async {
    Uri url = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=Tashkent&appid=44eef6f9ce88a4a4c25fc3c60bfaeaa5");
    var weatherData = await http.get(url);
    Weather weather = Weather.fromJson(jsonDecode(weatherData.body));
    print(weatherData.body);
    return weather;
  }
}
