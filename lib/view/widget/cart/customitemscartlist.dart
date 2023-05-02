import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  price,
                  style: const TextStyle(
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
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                  Container(
                    height: 30,
                    child: Text(
                      count,
                      style: const TextStyle(
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
    );
  }
}
