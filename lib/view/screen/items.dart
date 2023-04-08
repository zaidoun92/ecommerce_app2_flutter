import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/items_controller.dart';
import '../widget/customappbar.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleappbar: "find Product",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const SizedBox(height: 20),
            const CustomListCategoriesItems(),
          ],
        ),
      ),
    );
  }
}
