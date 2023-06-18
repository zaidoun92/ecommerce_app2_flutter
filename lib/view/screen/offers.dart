import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/offers/customitemoffer.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
              myController: controller.search!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              titleappbar: "find Product",
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
            ),
            const SizedBox(height: 20),
            !controller.isSearch
                ? HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CustomListItemsOffer(
                        itemsModel: controller.data[index],
                      ),
                    ),
                  )
                : ListItemsSearch(listdatamodel: controller.listdata),
          ],
        ),
      ),
    );
  }
}
