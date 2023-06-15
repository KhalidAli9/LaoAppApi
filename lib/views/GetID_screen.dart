import 'dart:convert';

import 'package:f_app_api/services/api/User/getByID.dart';
import 'package:f_app_api/services/contaners/GetID_screen/titleOfRespoce.dart';
import 'package:f_app_api/services/contaners/TextFelidCustom.dart';
import 'package:f_app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Order By Id "),
      ),
      body: ListView(children: [
        SizedBox(
          height: 16,
        ),
        TextFieldCustom(
            controller: idController,
            hint: "enter id",
            label: "ID",
            icon: Icons.numbers),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                if (int.parse(idController.text) is int) {
                  order =
                      json.decode((await getByID(id: idController.text)).body);
                  print(order);
                  if ((order["data"] as List).isEmpty) {
                    order = {};
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("number is empty")));
                  } else {
                    order = order["data"][0];
                  }

                  setState(() {});
                }
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("plase enter correct number")));
              }
            },
            child: Text("Get id"),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade200,
            ),
            child: Visibility(
              visible: order.isNotEmpty,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          titleOfRespoce(title: "ID : "),
                          Text(order["id"].toString()),
                        ],
                      ),
                      Row(
                        children: [
                          titleOfRespoce(title: "Titel : "),
                          Text(order["title"].toString()),
                        ],
                      ),
                      Row(
                        children: [
                          titleOfRespoce(title: "Content : "),
                          Text(
                            order["content"].toString(),
                            // overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titleOfRespoce(title: "Time : "),
                          Text(order["create_at"].toString()),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ]),
    );
  }
}
