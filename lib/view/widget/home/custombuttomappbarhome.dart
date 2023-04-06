import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custombuttonappbar.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length + 1,
              ((index) {
                int i =
                    index > controller.listPage.length / 2 ? index - 1 : index;
                return index == controller.listPage.length / 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        textButton: controller.titlebottomappbar[i],
                        icondata: Icons.home,
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentpage == i ? true : false,
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
