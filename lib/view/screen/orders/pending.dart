import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/pending_controller.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
