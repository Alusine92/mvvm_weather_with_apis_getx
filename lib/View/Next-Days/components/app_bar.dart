import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBarz extends StatelessWidget {
  const CustomAppBarz({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: ()
                {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.blue, size: 20,)),
          ),
          const Text(
            'Next 14 Days',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
