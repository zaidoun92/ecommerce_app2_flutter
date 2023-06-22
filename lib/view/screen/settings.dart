// ignore_for_file: avoid_unnecessary_containers
import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //   // onTap: () {},
                  //   title: const Text('Disable Notification'),
                  //   trailing: Switch(
                  //     value: true,
                  //     onChanged: (value) {},
                  //   ),
                  // ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.orderspending);
                    },
                    title: const Text('Orders'),
                    trailing: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title: const Text('Archive'),
                    trailing: const Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: const Text('Address'),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text('About us'),
                    trailing: const Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+201019872113"));
                    },
                    title: const Text('Contact us'),
                    trailing: const Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: const Text('Logout'),
                    trailing: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
