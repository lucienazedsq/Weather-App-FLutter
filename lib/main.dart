import 'package:appli_meteo/AfficheurMeteo.dart';
import 'package:appli_meteo/ApiMeteo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MA-CHA & Meteo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenWeather(),
    );
  }
}

class ScreenWeather extends StatefulWidget {
  const ScreenWeather({Key? key}) : super(key: key);

  @override
  _ScreenWeatherState createState() => _ScreenWeatherState();
}

class _ScreenWeatherState extends State<ScreenWeather> {
  final GlobalKey<ScaffoldState> _scaffoldKEY = new GlobalKey<ScaffoldState>();
  APImeteo Client = APImeteo();
  Meteo? meteo;
  String NameCity = "Abidjan";

  void refresh() {
    setState(() {
      NameCity = NameCity;
    });
  }

  Future<void> getData() async {
    meteo = await Client.getMeteoActuelle(NameCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKEY,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => _scaffoldKEY.currentState?.openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          centerTitle: true,
          title: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: const Text(
              "Weather",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: refresh,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                )),
          ],
        ),
        drawer: SizedBox(
          height: 650,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Drawer(
              elevation: 2,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.grey,
                              ))
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Choisir la ville :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(100, 100, 100, 1),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: const Icon(Icons.gps_fixed),
                          title: const Text(
                            "Abidjan",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            setState(() {
                              NameCity = "Abidjan";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: const Icon(Icons.gps_fixed),
                          title: const Text(
                            "Yamoussoukro",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            setState(() {
                              NameCity = "Yamoussoukro";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: const Icon(Icons.gps_fixed),
                          title: const Text(
                            "Lyon",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            setState(() {
                              NameCity = "Lyon";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Card(
                          color: Colors.black,
                          shadowColor: Colors.blueGrey,
                          child: SizedBox(
                            height: 1,
                            width: 400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Autres villes",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(100, 100, 100, 1),
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: RaisedButton(
                            child: const Text("Gerer les lieux"),
                            padding: const EdgeInsets.only(left: 60, right: 60),
                            elevation: 2,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Card(
                          color: Colors.black,
                          shadowColor: Colors.blueGrey,
                          child: SizedBox(
                            height: 1,
                            width: 400,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: RaisedButton(
                            color: Color.fromRGBO(56, 59, 64, 1),
                            child: const Text(
                              "A propos de l'application",
                              style: TextStyle(color: Colors.white),
                            ),
                            elevation: 1,
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const AlertDialog(
                                title: Text('A propos :'),
                                content: Text(
                                    "Ce projet nous a été soumis par notre professeur de flutter YAPO Sandrine afin de mettre a l'épreuve nos connaissances acquises dans le dudit cours"),
                              ),
                            ),
                            //---------------------------------------------------------
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          Colors.blueAccent,
                        ],
                      )),
                      child:
                          // Haut de l'interface -- Nom de la ville / Date / temps
                          Column(
                        children: [
                          Container(
                              height: 320,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(200),
                                    bottomRight: Radius.circular(200)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ListTile(
                                      title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${meteo!.NomVille}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  )),
                                  Text(
                                    "${meteo!.temperature}°",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Image.network(
                                    'http://openweathermap.org/img/w/${meteo!.iCon}.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 70,
                          ),

                          // Bas de la fenetre -- detail
                          Container(
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //-------------------------------------------------------------------------
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.cloud,
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                            Text("Temps"),
                                          ],
                                        ),
                                        Text("${meteo!.description}"),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),

                                //-------------------------------------------------------------------------
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.thermostat_rounded,
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                            Text("Temperature Min"),
                                          ],
                                        ),
                                        Text("${meteo!.temperature_min}°"),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),

                                //-------------------------------------------------

                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.thermostat,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                            Text("Temperature max"),
                                          ],
                                        ),
                                        Text("${meteo!.temperature_max}°"),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),

                                //---------------------------------------------------------
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(Icons.compare_arrows),
                                            ),
                                            Text("Pression"),
                                          ],
                                        ),
                                        Text("${meteo!.pression} Pa"),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),
                                //-----------------------------------------------------------------
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(Icons.air_rounded),
                                            ),
                                            Text("Vent"),
                                          ],
                                        ),
                                        Text("${meteo!.vent} Km/h"),
                                      ],
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),

                                //----------------------------------------------------------
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Icon(
                                                Icons.water_sharp,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            Text("Humidité"),
                                          ],
                                        ),
                                        Text("${meteo!.humidite} %"),
                                      ],
                                    )),
                              ],
                            )),
                          ),

                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container(
                child: const Center(
                  child: Text(
                    "Chargement des données...",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }));
  }
}


/* */