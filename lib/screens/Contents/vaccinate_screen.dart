import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_mulmed/config/pallete.dart';
import 'package:tugas_mulmed/model/model.dart';
import 'package:tugas_mulmed/widgets/widgets.dart';

class VaksinScreen extends StatefulWidget {
  static const String id = "Vaksin_screen";

  @override
  _VaksinScreenState createState() => _VaksinScreenState();
}

class _VaksinScreenState extends State<VaksinScreen> {
  Future<DataVaksin> dataIndo;

  Future dataVaksin() async {
    dataIndo = getDataVaksin(
        'https://disease.sh/v3/covid-19/vaccine/coverage/countries/Indonesia?lastdays=1&fullData=true',
        'https://disease.sh/v3/covid-19/vaccine/coverage?lastdays=1&fullData=true');
  }

  void initState() {
    super.initState();
    dataVaksin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.primaryColor,
        appBar: CustomAppBar(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Data Vaksinasi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FutureBuilder<DataVaksin>(
              future: dataIndo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                            title: Text(
                              "Indonesia",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(snapshot.data.indo[0].total)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                      Card(
                        child: ListTile(
                            title: Text(
                              "Global",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(snapshot.data.global)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              }),
        ]));
  }
}
