import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List<String> image = ["assets/a.jpg", "assets/b.jpeg","assets/d.jpeg","assets/c.jpeg","assets/f.jpeg"];
  List<String> text = [
    "Earth’s Formation",
    "Life Sustaining Atmosphere",
    "Oceanic Dominance",
    "Continental Drift",
    "Earth’s Magnetic Field"
  ];
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: image.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        controller.hasClients
                            ? (-(index * MediaQuery.of(context).size.height) +
                                    controller.position.pixels) /
                                2
                            : 0,
                        0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    image[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(textAlign: TextAlign.center,
                    text[index],
                    style: GoogleFonts.kaushanScript(
                        textStyle: TextStyle(color: Colors.white, fontSize: 55)),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
