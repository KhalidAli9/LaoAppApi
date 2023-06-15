import 'dart:convert';

import 'package:f_app_api/services/api/User/create_order.dart';
import 'package:f_app_api/services/api/User/get_orders.dart';
import 'package:f_app_api/services/contaners/order_screen/CardOrder.dart';
import 'package:f_app_api/services/contaners/TextFelidCustom.dart';
import 'package:f_app_api/services/extan/navigitor/pushEXT.dart';
import 'package:f_app_api/views/GetID_screen.dart';
import 'package:f_app_api/views/Login_screen.dart';
import 'package:f_app_api/views/order_screen.dart';
import 'package:f_app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    synchronizationGetOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Orders",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pushpage(GetScreenID());
          },
          icon: Icon(Icons.search),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushpage(LoginScreen());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFieldCustom(
              hint: "Title",
              label: "Title",
              controller: titleController,
              icon: Icons.read_more,
            ),
            TextFieldCustom(
                minLines: 3,
                maxLines: 10,
                hint: "content",
                label: "content",
                controller: contentController,
                icon: Icons.content_copy),
            Center(
              child: ElevatedButton(
                child: Text("Add"),
                onPressed: () async {
                  final result = await createOrder(context: context, body: {
                    "title": titleController.text,
                    "content": contentController.text
                  });

                  print(result.statusCode);
                  synchronizationGetOrder();
                },
              ),
            ),
            //-------------- display orders ---------------
            for (var item in listOrders)
              InkWell(
                  onTap: () {
                    context.pushpage(OrderScreen(order: item));
                  },
                  child: CardOrders(order: item)),
            SizedBox(
              height: 32,
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  synchronizationGetOrder() async {
    if ((await getOrders()).statusCode == 200) {
      listOrders = json.decode((await getOrders()).body)["data"];
      listOrders = List.from(listOrders.reversed);
      print(listOrders);
      setState(() {});
    } else {
      final box = GetStorage();
      box.remove("token");
      context.pushAndRemove(view: LoginScreen());
    }
  }
}
