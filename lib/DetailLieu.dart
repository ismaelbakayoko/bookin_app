import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ismo_travel_app/mapPage.dart';
import 'package:ismo_travel_app/model/activites.dart';
import 'package:ismo_travel_app/model/hotel.dart';
import 'package:ismo_travel_app/model/lieu.dart';
import 'package:ismo_travel_app/model/photo.dart';
import 'package:toastification/toastification.dart';

class DetailLieu extends StatefulWidget {
  const DetailLieu({super.key, required this.villesId});
  final int? villesId;

  @override
  State<DetailLieu> createState() => _DetailLieuState();
}

class _DetailLieuState extends State<DetailLieu> {
  ModelLieux? Listlieu;
  List<ModelHotel>? ListHotels = [];
  List<ModelPhoto>? ListPhoto = [];
  List<ModelActivites>? ListActivites = [];

  Future<void> villes() async {
    try {
      print("${widget.villesId}");
      final url = Uri.parse(
          "http://192.168.1.22/tourisme_journey_api/villes/getVilleById.php?id=1");
      final response = await http.get(url);

      final responseDecode = jsonDecode(response.body);

      if (responseDecode['status'] == "success") {
        setState(() {
          Listlieu = ModelLieux.fromJson(responseDecode['data']["lieu"]);
        });
        print(Listlieu);
        for (var element in responseDecode['data']["photos"]) {
          ListPhoto!.add(ModelPhoto.fromJson(element));
        }
        print(ListPhoto);
        for (var element in responseDecode['data']["activities"]) {
          ListActivites!.add(ModelActivites.fromJson(element));
        }
        print(ListActivites);
        for (var element in responseDecode['data']["hotels"]) {
          ListHotels!.add(ModelHotel.fromJson(element));
        }
        print(ListHotels);
      } else {
        print("la ville n'existe pas");
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
    await villes();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Discover"),
                Tab(
                  text: "Activities",
                ),
              ],
            ),
            title: Text("Explore"),
            centerTitle: true,
          ),
          body: TabBarView(children: [
            Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.topLeft,
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage("${Listlieu?.photo_url}"),
                      fit: BoxFit.cover,
                    )),
                    child: Center(
                      child: Text(
                        "${Listlieu?.nom}",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "See all",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            width: 90,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                      SizedBox(
                          height: 500,
                          child: GridView.builder(
                              itemCount: ListHotels!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => mapPage(
                                                  hotel: {
                                                    "nom_hotel":
                                                        ListHotels![index]
                                                            .nom_hotel,
                                                    "description_complete":
                                                        ListHotels![index]
                                                            .description_complete,
                                                    "email": ListHotels![index]
                                                        .email,
                                                    "bref_description":
                                                        ListHotels![index]
                                                            .bref_description,
                                                    "image_hotel":
                                                        ListHotels![index]
                                                            .image_hotel,
                                                    "lieu_id":
                                                        ListHotels![index]
                                                            .lieu_id,
                                                    "tel_responsable":
                                                        ListHotels![index]
                                                            .tel_responsable,
                                                  },
                                                )))
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      width: 50,
                                      // height: 150,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      "${ListHotels![index].image_hotel}",
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      "${ListHotels![index].nom_hotel}",
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.more_vert)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ]),
                  ),
                ],
              )),
            ),
            Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.topLeft,
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage("${Listlieu?.photo_url}"),
                      fit: BoxFit.cover,
                    )),
                    child: Center(
                      child: Text(
                        "${Listlieu?.nom}",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "See all",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            width: 90,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                      SizedBox(
                          height: 500,
                          child: GridView.builder(
                              itemCount: ListHotels!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    width: 50,
                                    // height: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${ListActivites![index].image_activite}",
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    "${ListActivites![index].nom_activite}",
                                                    maxLines: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(Icons.more_vert)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                    ]),
                  ),
                ],
              )),
            ),
          ]),
        ));
  }
}
