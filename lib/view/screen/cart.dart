// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "price",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "1200 \$",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Shopping",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "300 \$",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Total Price",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "1500 \$",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButtonCart(textbutton: "Pleace Order", onPressed: () {}),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "My Cart",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            AppImageAsset.logo,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Macbook M2 Max",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            subtitle: Text(
                              "300.00 \$",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 35,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                              ),
                              Container(
                                height: 30,
                                child: const Text(
                                  "2",
                                  style: TextStyle(
                                    fontFamily: "sana",
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
