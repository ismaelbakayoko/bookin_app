import 'dart:ffi';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ismo_travel_app/CustomizeLieuPage.dart';
import 'package:ismo_travel_app/DetailLieu.dart';
import 'package:ismo_travel_app/model/lieu.dart';
import 'package:toastification/toastification.dart';

class ListeLieuPage extends StatefulWidget {
  const ListeLieuPage({super.key});

  @override
  State<ListeLieuPage> createState() => _ListeLieuPageState();
}

class _ListeLieuPageState extends State<ListeLieuPage> {
  List<ModelLieux> ListLieux = [];
  bool isLoading = false;

  Future<void> Lieux() async {
    try {
      final url = Uri.parse(
          "http://192.168.1.22/tourisme_journey_api/villes/getVilles.php");
      final response = await http.get(url);

      final responseDecode = jsonDecode(response.body);

      if (responseDecode['status'] == "success") {
        for (var element in responseDecode['data']) {
          ListLieux!.add(ModelLieux.fromJson(element));
        }
        if (ListLieux != null) {
          setState(() {
            isLoading = true;
          });
        }
      } else {
        toastification.show(
          context: context,
          title: Text('Aucune ville disponibles'),
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      print("Erreur: $e");
    }
  }

  Future<void> init() async {
    await Lieux();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 234, 234),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bookings",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          "72  ITEMS",
                          style: TextStyle(color: Color.fromARGB(131, 0, 0, 0)),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Row(children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text("Filters",
                                  style: TextStyle(color: Colors.white))
                            ])))
                  ],
                ),
              ),
              isLoading == true
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: ListLieux.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailLieu(
                                          villesId: ListLieux[index].id),
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(15),
                                height: 280,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${ListLieux[index].photo_url}"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 100),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${ListLieux[index].nom}",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "${ListLieux[index].temperature} °  257  km away",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.sunny,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 45,
                                          ),
                                          Column(children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${ListLieux[index].temperature}",
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          color: Colors.white)),
                                                  Container(
                                                    height: 2,
                                                    width: 170,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    192,
                                                                    255,
                                                                    255,
                                                                    255)),
                                                  )
                                                ]),
                                            const Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("sunny",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            224,
                                                            255,
                                                            255,
                                                            255))),
                                                SizedBox(
                                                  width: 70,
                                                ),
                                                Icon(
                                                  Icons.heart_broken_sharp,
                                                  color: Color.fromARGB(
                                                      221, 255, 255, 255),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "4k",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          232, 255, 255, 255)),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.message,
                                                  color: Color.fromARGB(
                                                      224, 255, 255, 255),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "789",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          214, 255, 255, 255)),
                                                )
                                              ],
                                            )
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  : CircularProgressIndicator(),
              SizedBox(
                height: 178,
              )
            ],
          ),
        ),
      ),
    );
  }
}
