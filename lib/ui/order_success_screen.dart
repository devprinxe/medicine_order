import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_order/ui/home_screen.dart';

import '../controller/cart_controller.dart';
import '../style/constant.dart';
import 'cart_screen.dart';

class OrderSuccess extends StatelessWidget {
  OrderSuccess({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => GestureDetector(
              onTap: () => Get.to(CartScreen()),
              child: Badge(
                badgeContent: Text(controller.totalItems.toString()),
                badgeColor: kBadgeColor,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Icon(Icons.check_circle_rounded,size: 128.0,color: kBadgeColor,)),
            const SizedBox(height: 20.0,),
            Text('Order Placed Successfully',style: kTextStyle.copyWith(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),maxLines: 2,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('One of our representatives will confirm your order shortly. You will receive an invoice through SMS.',style: kTextStyle.copyWith(color: Colors.black,fontSize: 16.0),maxLines: 4,textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => HomeScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color:const Color(0xFFE6E7E8),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Center(child: Text('Back To Home',style: kTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600),),),
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => HomeScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor),
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Center(child: Text('View Orders',style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.w600),),),

                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
