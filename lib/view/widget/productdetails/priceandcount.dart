import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class PriceAndCount extends StatelessWidget {
  final String count;
  final String price;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const PriceAndCount({
    super.key,
    required this.count,
    required this.price,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 2),
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(count,
                  style: const TextStyle(fontSize: 20, height: 1.1)),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 30,
            height: 1.1,
          ),
        )
      ],
    );
  }
}
