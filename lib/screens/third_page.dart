import 'package:dars40/model/country_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class ThirdPage extends StatefulWidget {
  Countries city;
  ThirdPage(this.city);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Countries? city;

  initState() {
    super.initState();
    city = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    var PageController;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 180,
                    child: PageView.builder(itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://source.unsplash.com/random/$index"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    })),
                Positioned(
                  top: 30,
                  left: 15,
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
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Meadow Springs Golf And\nCountry Club ",
                style: TextStyle(
                  fontFamily: "dars40",
                  fontSize: 27,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Seoul ",
                style: TextStyle(
                  fontFamily: "dars40",
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.call)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.navigation)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right_alt),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 130,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.white, width: 0.3))),
                    onPressed: () {},
                    child: const Text(
                      "Follows",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Information",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("⭐️ 4.6"),
               
                Text('population 1000000M'),
                
                Icon(Icons.golf_course),
                
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                
                Text(
                  "431 reviews",
                  style: TextStyle(color: Colors.grey),
                ),
                
                Text(
                  "population",
                  style: TextStyle(color: Colors.grey),
                ),
              
                Text(
                  "18 holes",
                  style: TextStyle(color: Colors.grey),
                ),
                
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Seoul, Korean Sŏul, formally Sŏul-t’ŭkpyŏlsi (“Special City of Seoul”), city and capital of South Korea (the Republic of Korea). It is located on the Han River (Han-gang) in the northwestern part of the country, with the city centre some 37 miles (60 km) inland from the Yellow Sea (west). Seoul is the cultural, economic, and political centre of South Korea."),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.white, width: 0.3))),
                      onPressed: () {},
                      child: const Text(
                        "Preview",
                        style:
                            TextStyle(color: Colors.greenAccent, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.white, width: 0.3))),
                    onPressed: () {},
                    child: const Text(
                      "Start Round",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
