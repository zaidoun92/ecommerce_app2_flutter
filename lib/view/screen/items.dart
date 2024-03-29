import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/items/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/items_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/listcategoriesitems.dart';
import 'home.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
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
            const CustomListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ["items_id"]] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                            itemsModel: ItemsModel.fromJson(
                              controller.data[index],
                            ),
                          );
                        },
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
