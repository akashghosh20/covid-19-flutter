import 'package:covid19/api.dart';
import 'package:covid19/widgets/app_bar.dart';
import 'package:covid19/widgets/myCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List _countries = [];

void main() => runApp(Homepage());

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void fetchData() async {
    http.Response response = await http.get(Uri.parse(api));
    final countries = json.decode(response.body);

    setState(() {
      _countries = countries;
    });
    print(_countries);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    print(_countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        _countries.isNotEmpty
            ? DropdownButton(
                items: _countries.map((value) {
                  return DropdownMenuItem(
                      value: value['country'],
                      child: Row(
                        children: [
                          Image.network(value['countyInfo']['flag']),
                          SizedBox(
                            width: 8,
                          ),
                          Text(value['country']),
                        ],
                      ));
                }).toList(),
                onChanged: (value) {
                  print(value);
                })
            : CircularProgressIndicator(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        data: "0",
                        bgColor: Colors.lightGreen,
                        textColor: Colors.white,
                        belowText: "Total Cases")),
                Expanded(
                    child: MyCard(
                        data: "5",
                        bgColor: Colors.amber,
                        textColor: Colors.white,
                        belowText: "total cases")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
