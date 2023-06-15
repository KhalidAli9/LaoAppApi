import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          order["title"],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(order["title"],
                      style: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    order["content"],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order["id"].toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 22, 107, 177),
                  ),
                ),
                Text(order["create_at"]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
