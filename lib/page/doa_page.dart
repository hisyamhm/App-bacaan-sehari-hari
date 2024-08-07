import 'dart:convert';
import 'package:bacaan_sholat/model/model_doa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class Doa extends StatefulWidget {
  const Doa({Key? key}) : super(key: key);

  @override
  _DoaState createState() => _DoaState();
}

class _DoaState extends State<Doa> {
  Future<List<ModelDoa>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/doa.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ModelDoa.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(213, 255, 251, 0)),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        margin: EdgeInsets.only(top: 120, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tuntunan Doa-doa",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Doa Sehari-hari, sudah hafal belum?",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/doa_sehari.jpg",
                      width: 330,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<ModelDoa>;
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: EdgeInsets.all(15),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Color.fromARGB(120, 2, 182, 253)),
                              child: ExpansionTile(
                                title: Text(
                                  items[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  items[index]
                                                      .arabic
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  items[index]
                                                      .latin
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 5),
                                                child: Text(
                                                    items[index]
                                                        .terjemahan
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
