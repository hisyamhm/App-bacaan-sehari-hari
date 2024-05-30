import 'dart:ui';

import 'package:bacaan_sholat/page/doa_page.dart';
import 'package:bacaan_sholat/page/bacaan_sholat_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 380,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'TUNTUNAN BACAAN SHOLAT & DOA-DOA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NiatSholat()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/niat_sholat.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Niat-niat Sholat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BacaanSholat()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image:
                                AssetImage("assets/images/tuntunan_sholat.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tuntunan Sholat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Doa()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/doa_doa.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Doa-doa Sehari-hari",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
