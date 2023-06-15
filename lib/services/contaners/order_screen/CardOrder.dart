import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key, required this.order});
  final Map order;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          order["title"],
          style: TextStyle(
            color: Color.fromARGB(255, 22, 107, 177),
          ),
        ),
        // subtitle: Text(order["content"],
        //     style: TextStyle(
        //       color: Colors.blue.shade200,
        //     )),
        trailing: Text(order["create_at"]),
        
      ),
      
    );
  }
}
