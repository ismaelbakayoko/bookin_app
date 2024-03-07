import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ismo_travel_app/model/hotel.dart';
import 'package:ismo_travel_app/model/lieu.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class mapPage extends StatefulWidget {
  const mapPage({super.key, required this.hotel});
  final Map<String, dynamic>? hotel;

  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  List<ModelHotel>? ListHotel;
  ModelLieux? ListLieu;

  List<ModelHotel> ListHotels = [];

  Future<void> init() async {}
  Future<void> _launchUrl(String phone) async {
    final Uri _url = Uri.parse('tel:$phone');
    print("avant le if");
    if (!await launchUrl(_url)) {
      print("tous vas bien");
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, right: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.clear,
                          color: const Color.fromARGB(202, 0, 0, 0),
                          size: 25,
                        ),
                        Padding(padding: EdgeInsets.only(right: 10, left: 50)),
                        Text(
                          "Map View",
                          style: TextStyle(
                              color: const Color.fromARGB(215, 0, 0, 0),
                              fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
              height: 380,
              decoration: BoxDecoration(color: Colors.amber),
            ),
            Container(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage("${widget.hotel!["image_hotel"]}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 20,
                      child: CircleAvatar(
                        child: IconButton(
                          icon: const Icon(Icons.phone),
                          onPressed: () {
                            _launchUrl(widget.hotel!["tel_responsable"]);
                          },
                        ),
                      ),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.hotel!["nom_hotel"]}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text("${widget.hotel![""]}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    width: 360,
                    child: Divider(
                      color: Color.fromARGB(174, 0, 0, 0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 15, bottom: 20, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Desription",
                          style: TextStyle(
                              color: const Color.fromARGB(146, 0, 0, 0)),
                        ),
                        Text(
                          "${widget.hotel!["bref_description"]}",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 60,
                      width: 350,
                      alignment: Alignment.center,
                      child: Text(
                        "Get Directions",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
