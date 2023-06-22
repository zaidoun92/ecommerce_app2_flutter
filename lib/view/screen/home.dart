import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customcarthome.dart';
import 'package:ecommercecourse/view/widget/home/customlistcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/customlistitemshome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../linkapi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCartHome(
                            title: controller.titleHomeCard,
                            body: controller.bodyHomeCard),
                        CustomTitleHome(title: "43".tr),
                        const CustomListCategoriesHome(),
                        CustomTitleHome(title: "44".tr),
                        const CustomListItemsHome(),
                        CustomTitleHome(title: "45".tr),
                        const CustomListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({
    super.key,
    required this.listdatamodel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${listdatamodel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].categoriesName!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
